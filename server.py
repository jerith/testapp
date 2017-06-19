from aiohttp import web


async def handle(request):
    text = "Hello, spinnaker helped me get here by trigger."
    print('received request, replying with "{}".'.format(text))
    return web.Response(text=text)


app = web.Application()
app.router.add_get('/', handle)

web.run_app(app, port=5858)
