class ApiEndpoints {
  static const String authToken ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjY5NzQzZTk2ZjczY2I5OGYxZmEyNzM3IiwidXNlcm5hbWUiOiJhbWl0QGdtYWlsLmNvbSJ9LCJpYXQiOjE3MjIyMjQxNDcsImV4cCI6MTcyMjIyNzc0N30.H-7aTWAjOmG2GJB-YaBxnZZBd71_8UNmZ7_IcKQieuM';
  //static const String authToken ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMSIsInVzZXJuYW1lIjoiVmlrcmFtIn0sImlhdCI6MTcyMjEzOTg3MSwiZXhwIjoxNzIyMTQzNDcxfQ.Tbpy7C6zU5O4QIuHdwC66UOfBzW9F7C_roZ4XHdgCgM';
  static const String baseUrl = 'http://localhost:3000/api';
  static const String product = '$baseUrl/products';
  static const String category = '$baseUrl/categories';
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
}