import http.server, socketserver, socket
import subprocess as sub

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="public", **kwargs)

    def send_response_only(self, code, message=None):
        super().send_response_only(code, message)
        self.send_header('Cache-Control', 'no-store, must-revalidate')
        self.send_header('Expires', '0')

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("",0))
s.listen(1)
port = s.getsockname()[1]
s.close()

with socketserver.TCPServer(("", port), Handler) as httpd:
    url = "http://localhost:" + str(port)
    print(url)
    sub.Popen(["firefox", url], stdout = sub.DEVNULL)
    httpd.serve_forever()
