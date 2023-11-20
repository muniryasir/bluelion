virtual_hosts = {
    "promenades.chatou.fr": "chatou_auto.urls",
    "parcours.commune1871.org": "commune_de_paris.urls",
    # "8.209.105.42/admin":"admin.site.urls"
    # "www.example-b.dev": "links.urls",
    # "www.example-c.dev": "links.urls",
}
class VirtualHostMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # let's configure the root urlconf
        host = request.get_host()
        request.urlconf = virtual_hosts.get(host)
        # order matters!
        response = self.get_response(request)
        return response