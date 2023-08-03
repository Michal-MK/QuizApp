import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final controller = WebViewController();

  @override
  void initState() {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.enableZoom(false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    MediaQueryData s = MediaQuery.of(context);
    controller.loadHtmlString("""
<!doctype html>
<html>

<head>
    <script src="https://api.mapy.cz/loader.js"></script>
    <script>Loader.load()</script>
    <script>
  document.addEventListener('wheel', function(e) {
    e.ctrlKey && e.preventDefault();
  }, {
    passive: false,
  });
</script>
<script>
  window.addEventListener('keydown', function(e) {
    if (event.metaKey || event.ctrlKey) {
      switch (event.key) {
        case '=':
        case '-':
          event.preventDefault();
          break;
      }
    }
  });
</script>
</head>

<body>
    <div id="mapa" style="width:${(s.size.width * s.devicePixelRatio).toInt()}px; height:${(s.size.height * s.devicePixelRatio).toInt()}px;"></div>
    <script type="text/javascript">
        var m = new SMap(JAK.gel("mapa"), SMap.Coords.fromWGS84(14.400307, 50.071853));
        m.addControl(new SMap.Control.Sync()); /* Aby mapa reagovala na změnu velikosti průhledu */
        m.addDefaultLayer(SMap.DEF_BASE).enable();
        var mouse = new SMap.Control.Mouse(SMap.MOUSE_PAN | SMap.MOUSE_WHEEL | SMap.MOUSE_ZOOM); /* Ovládání myší */
        m.addControl(mouse);

        function click(e, elm) { /* Došlo ke kliknutí, spočítáme kde */
            var coords = SMap.Coords.fromEvent(e.data.event, m);
            alert("Kliknuto na " + coords.toWGS84(2).reverse().join(" "));
        }
        m.getSignals().addListener(window, "map-click", click); /* Při signálu kliknutí volat tuto funkci */    
    </script>
</body>

</html>
""");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
