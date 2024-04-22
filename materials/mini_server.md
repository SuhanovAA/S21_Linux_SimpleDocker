## Running **C** code using **FastCGI** & **nginx**

By using the API provided by <fcgiapp.h> header, the socket details can be specified, which spawning via external means does for you.

A TCP socket file descriptor can be got like this:
`int sockfd = FCGX_OpenSocket("127.0.0.1:9000", 100);`

...or using Unix sockets:
`int sockfd = FCGX_OpenSocket("/var/run/fcgi.sock", 100);`

With the socket it can be written then:
```
FCGX_Request req;
FCGX_InitRequest(&req, sockfd, 0);

while (FCGX_Accept_r(&req) >= 0) {
FCGX_FPrintF(req.out, "Content-Type: text/html\n\n");
FCGX_FPrintF(req.out, "hello world");
FCGX_Finish_r(&req);
}
```

Once compile, the binary can be executed directly without using *spawn-fcgi* or *cgi-fcgi*.




Используя API, предоставляемый заголовком <fcgiapp.h>, можно указать сведения о сокете, что позволяет запускать его с помощью внешних средств.

Файловый дескриптор сокета TCP можно получить следующим образом:
`int sockfd = Сокет FCGX_Open("127.0.0.1:9000", 100);`

...или с использованием сокетов Unix:
`int sockfd = FCGI_OpenSocket("/var/run/fcgi.sock", 100);"

С помощью сокета это можно записать, а затем:
```
Запрос FCGX_Request;
FCGX_InitRequest(&req, sockfd, 0);

в то время как (FCGX_Accept_r(&req) >= 0) _BOS_
FCGX_FPrintF(запрос "Тип содержимого: текст/html");
FCGX_FPrintF(запрос "привет, мир");
FCGX_Finish_r(&req);
}
```

После компиляции двоичный файл может быть выполнен напрямую, без использования *spawn-fcgi* или *cgi-fcgi*.