// Lab1_Service.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <WinSock2.h>
#include <iostream>
#include <stdio.h>
#include <WS2tcpip.h>
#include <Windows.h>

using namespace std;
#pragma comment(lib,"ws2_32.lib")

#define SERVER_UDP_PORT 6880
#define SERVER_TCP_PORT 6881

//#define _WINSOCK_DEPRECATED_NO_WARNINGS 1

DWORD WINAPI tcp_clent_thread(LPVOID lpParameter);
DWORD WINAPI udp_clent_thread(LPVOID lpParameter);

int main()
{
	//创建套接字
	WORD myVersionRequest;
	WSADATA wsaData;
	myVersionRequest = MAKEWORD(2, 2);
	int err;
	err = WSAStartup(myVersionRequest, &wsaData);
	if (!err) {
		//printf("已打开套接字\n");
	}
	else {
		printf("ERROR:套接字未打开!");
		return 1;
	}
	//绑定套接字tcp
	SOCKET socket_serv_tcp = socket(AF_INET, SOCK_STREAM, 0);//创建了可识别套接字
	SOCKADDR_IN addr_tcp;
	addr_tcp.sin_family = AF_INET;
	addr_tcp.sin_addr.S_un.S_addr = htonl(INADDR_ANY);//ip地址
	addr_tcp.sin_port = htons(SERVER_TCP_PORT);//绑定端口

	bind(socket_serv_tcp, (SOCKADDR*)&addr_tcp, sizeof(SOCKADDR));//绑定完成
	listen(socket_serv_tcp, 5);//其中第二个参数代表能够接收的最多的连接数
	//绑定套接字udp
	SOCKET socket_serv_udp = socket(AF_INET, SOCK_DGRAM, 0);//创建了可识别套接字
	SOCKADDR_IN addr_udp;
	addr_udp.sin_family = AF_INET;
	addr_udp.sin_addr.S_un.S_addr = htonl(INADDR_ANY);//ip地址
	addr_udp.sin_port = htons(SERVER_UDP_PORT);//绑定端口

	bind(socket_serv_udp, (SOCKADDR*)&addr_udp, sizeof(SOCKADDR));//绑定完成

	SOCKADDR_IN clientsocket;
	int len = sizeof(clientsocket);

	fd_set readfds,testfds;
	FD_ZERO(&readfds);
	FD_SET(socket_serv_tcp,&readfds);
	FD_SET(socket_serv_udp, &readfds);
	//struct timeval tv = { 1, 0 };
	DWORD       dwThreadId, dwThreadId2;
	HANDLE hHandle1 = CreateThread(NULL, 0, tcp_clent_thread, NULL, 0, &dwThreadId);
	//HANDLE hHandle2 = CreateThread(NULL, 0, udp_clent_thread, NULL, 0, &dwThreadId2);
	while (1)
	{
		int fd;
		testfds = readfds;
		cout << "Server waiting!" << endl;
		int result = select(FD_SETSIZE, &readfds, (fd_set *)0, (fd_set *)0, NULL);
		if (result < 1) {
			cerr << "catched error!" << endl;
			exit(1);
		}
		for (fd = 0;fd < FD_SETSIZE;fd++) {
			if (FD_ISSET(fd, &readfds)) {
				if (fd == socket_serv_tcp) {//tcp连接请求
					SOCKET serConn = accept(socket_serv_tcp, (SOCKADDR*)&clientsocket, &len);
					FD_SET(serConn, &readfds);
					cout << "accepted a tcp connection!" << endl;
				}
				else if (fd == socket_serv_tcp) {//udp连接请求
					char *sendBuffer;
					char recvBuffer[100];				
					int result = recvfrom(socket_serv_udp, recvBuffer, sizeof(recvBuffer),0,
						(sockaddr *)&clientsocket, &len);
					cout << "Received message form UDP client:\n"
						<< recvBuffer <<endl;
					sendBuffer = "hello client,I am server!";
					sendto(socket_serv_udp, sendBuffer,strlen(sendBuffer),0,
						(sockaddr *)&clientsocket, len);
					
				}
				else {//新建的tcp连接
					
					char receiveBuf[100];//接收
					int ret=recv(fd, receiveBuf, sizeof(receiveBuf), 0);
					if (ret == 0 || (ret == SOCKET_ERROR && WSAGetLastError() == WSAECONNRESET)) {
						closesocket(fd);
						FD_CLR(fd, &readfds);
					}
					else {
						cout << "Received message form TCP client:\n"
							<< receiveBuf << endl;
						char sendBuf[100]="Hello,client:\n";
						printf("Send:%s\n", sendBuf);
						send(fd, sendBuf, strlen(sendBuf) + 1, 0);
					}
				}
			}
			
		}
		
		closesocket(socket_serv_tcp);//关闭tcp
		closesocket(socket_serv_udp);//关闭udp
		FD_CLR(socket_serv_tcp, &readfds);
		FD_CLR(socket_serv_udp, &readfds);
		WSACleanup();//释放资源的操作
		CloseHandle(hHandle1);
		//CloseHandle(hHandle2);
		return 0;
	}
	system("pause");
    return 0;
}
DWORD WINAPI tcp_clent_thread(LPVOID lpParam)
{
	
	WSADATA wsaData;
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Failed to load Winsock./n");
		return -1;
	}
	for (int i = 0;i < 10;i++) {
		SOCKET sClient;
		int iLen;//从服务器端接收的数据长度
		char buf[100];//接收数据的缓冲区
		SOCKADDR_IN ser;//服务器端地址
		memset(buf, 0, sizeof(buf));//接收缓冲区初始化
		//填写要连接的服务器地址信息
		ser.sin_family = AF_INET;
		ser.sin_port = htons(6881);
		//ser.sin_addr.s_addr = inet_addr("127.0.0.1");
		inet_pton(AF_INET, "127.0.0.1",&ser.sin_addr.s_addr);
		//建立客户端流式套接口
		sClient = socket(AF_INET, SOCK_STREAM, 0);
		if (sClient == INVALID_SOCKET)
		{
			printf("socket() Failed: %d/n", WSAGetLastError());
			return -1;
		}
		//请求与服务器端建立TCP连接
		if (connect(sClient, (struct sockaddr *)&ser, sizeof(ser)) == INVALID_SOCKET)
		{
			printf("connect() Failed: %d/n", WSAGetLastError());
			return -1;
		}
		else
		{
			char sendBuf[100];
			sprintf_s(sendBuf, "Hello Server,I am client %d", i);
			//printf("Send:%s\n", sendBuf);
			send(sClient, sendBuf, strlen(sendBuf) + 1, 0);

			//从服务器端接收数据
			iLen = recv(sClient, buf, sizeof(buf), 0);
			if (iLen == 0)
				return -1;
			else if (iLen == SOCKET_ERROR)
			{
				printf("recv() Failed: %d/n", WSAGetLastError());
				return -1;
			}
			else {
				cout << "I am  UDP Client " << i << endl;
				cout << "Receive from server:" << buf << endl;
			}
				
		}
		closesocket(sClient);
		Sleep(3000);
	}
	WSACleanup();
	//system("pause");
	return 0;
}
DWORD WINAPI udp_clent_thread(LPVOID lpParam)
{
	/**
	WSADATA wsaData;
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Failed to load Winsock./n");
		return -1;
	}*/
	for (int i = 0;i < 10;i++) {
		SOCKET socket_serv_udp;
		int iLen;
		char sendBuffer[100];
		SOCKADDR_IN socket_addr;
		memset(sendBuffer, 0, sizeof(sendBuffer));						
		socket_addr.sin_family = AF_INET;
		socket_addr.sin_port = htons(6880);
		//socket_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
		inet_pton(AF_INET, "127.0.0.1", &socket_addr.sin_addr.s_addr);
		socket_serv_udp = socket(AF_INET, SOCK_DGRAM, 0);
		int len = sizeof(socket_addr);
		if (socket_serv_udp == INVALID_SOCKET)
		{
			printf("socket() Failed: %d/n", WSAGetLastError());
			return -1;
		}

		sendto(socket_serv_udp, sendBuffer, strlen(sendBuffer), 0,
			(sockaddr *)&socket_addr,len);
		char recvBuffer[100];
		int result = recvfrom(socket_serv_udp, recvBuffer, sizeof(recvBuffer), 0,
			(sockaddr *)&socket_addr, &len);
		cout << "I am  UDP Client " << i << endl;
		cout << "Receive from server:" << recvBuffer << endl;
		closesocket(socket_serv_udp);
		Sleep(3000);
	}
	//WSACleanup();
	return 0;
}
