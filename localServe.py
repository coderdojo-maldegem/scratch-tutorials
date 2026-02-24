import os, http.server, socketserver, socket
import subprocess as sub

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="public", **kwargs)

    def send_response_only(self, code, message=None):
        super().send_response_only(code, message)
        self.send_header('Cache-Control', 'no-store, must-revalidate')
        self.send_header('Expires', '0')

    def log_message(self, format, *args):
        pass

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("",0))
s.listen(1)
port = s.getsockname()[1]
s.close()

sub.Popen(["firefox", "http://localhost:" + str(port)], stdout=sub.DEVNULL, stderr=sub.DEVNULL)

with socketserver.TCPServer(("", port), Handler) as httpd:
    httpd.serve_forever()
