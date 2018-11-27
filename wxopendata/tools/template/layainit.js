//index.js
//获取应用实例
var app = getApp()
var inputContainerStyle =
  {
    left: 100,
    top: 100,
    value: "",
    inputStyle: "background-color:#ff0000;width:200px;height:20px;",
    fontSize: 12,/////
    color: "#00ff00",
    focus: false,
    placeholder:"",
    scaleX:1,
    scaleY:1,
    display: "none"
  }
var textAreaContainerStyle =
  {
  }
for (key in inputContainerStyle) {
  textAreaContainerStyle[key] = inputContainerStyle[key];
}
var pageData = {
  canvasWidth: 300,
  canvasHeight: 500,
  textAreaContainerStyle: textAreaContainerStyle,
  inputContainerStyle: inputContainerStyle

}
app.pageData = pageData;
app.LayaInitData = {
  data: pageData,
  inputHandler: function (res) {
    if (inputContainerStyle.inputFunction) {
      inputContainerStyle.inputFunction(res);
    }
  },
  areaHandler: function (res) {
    if (textAreaContainerStyle.inputFunction) {
      textAreaContainerStyle.inputFunction(res);
    }
  },
  onAudioEnd: function (e) {
    if (app.SoundEndHandler) {
      app.SoundEndHandler(e);
    }
  },
  onAudioUpdate: function (e) {
    //console.log("onAudioUpdate", e);
  },
  onTouchStart: function (e) {
    //console.log("onTouchStart",e)
    if (app.mouseHandler) {
      app.mouseHandler(e);
    }
  },
  onLoad: function () {
    var that = this;
    app.that = that;
    wx.getSystemInfo({
      success: function (res) {
        console.log("getSystemInfo", res);
        app.windowWidth = res.windowWidth;
        app.windowHeight = res.windowHeight;
        app.isDebugMode = res.platform == "devtools";
        // inputContainerStyle.display="normal";
        that.setData({
          canvasWidth: app.windowWidth,
          canvasHeight: app.windowHeight,
          inputContainerStyle: inputContainerStyle
        })

        adptRunningContext();
        beginMain();
      }
    })
    function beginMain() {
      try {
        require("indexlayaair.js")
        //require("layaairadpter2.js");
        // require("test.js");
        //require("test2.js");
        //  require("index4.js");
      } catch (e) { console.log(e.message, e.stack) }
    }


  }
}

function adptRunningContext() {
  var window = global;
  app.window = window;

  window.addEventListener = function () { };
  window.navigator = { userAgent: "" };
  window.location = { protocol: "https:", pathname: "001" };
  window.focus = function () { };
  window.setTimeout = setTimeout;
  window.requestAnimationFrame = function (fun) {
    setTimeout(fun, 1000 / 60);
  }

  var document = document || (window.document = {});
  document.body = {};
  document.body.style = {};
  document.body.clientHeight = app.windowHeight;
  document.body.clientWidth = app.windowWidth;
  document.getElement = function () { return {} }
  document.body.appendChild = function () { return {} }
  document.getElementsByTagName = function () { return [] }

  function makeSetProperty(tar, key, fun, storeKey) {
    var dataO = {};
    dataO.set = function (v) {
      this[fun](v);
      this[storeKey] = v;
    }
    dataO.get = function () {
      return this[storeKey];
    }
    Object.defineProperty(tar, key, dataO)
  }
  function adptCtx(to) {
    var fromO = app.contextFrom;
    if (!fromO) {
      console.log("from not found");
    }
    //console.log("adptCtx");
    to.__fillText = to.fillText;
    to.__fillRect = to.fillRect;
    to.__strokeText = to.strokeText;
    var funs = ['drawTextures', 'fillWords', 'fillBorderWords', 'setIsMainContext', 'fillRect', 'strokeText', 'fillTexture', 'fillText', 'transformByMatrix', 'setTransformByMatrix', 'clipRect', 'drawTexture', 'drawTexture2', 'drawTextureWithTransform', 'flush', 'clear', 'destroy', 'drawCanvas', 'fillBorderText', 'drawCurves'];
    var i, len;
    len = funs.length;
    var key;
    for (i = 0; i < len; i++) {
      key = funs[i];
      to[key] = fromO[key];
    }
  }
  function adptDrawImage(ctx) {
    ctx.drawImage = function () {
      var dataArr;
      // dataArr = []
      // dataArr.length=5;
      if (arguments.length == 9) {
        dataArr = [arguments[0], arguments[5], arguments[6], arguments[7], arguments[8]];
      } else {
        dataArr = [arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]];
      }
      // var i, len;
      // len = arguments.length;
      // for (i = 0; i < len; i++) {
      //   dataArr.push(arguments[i]);
      // }
      this.actions.push({
        method: "drawImage",
        data: dataArr
      })
    };
  }
  document.createElement = function (type) {
    var rst = {};
    if (type == "canvas") {

      rst.getContext = function () {
        var ctx = wx.createCanvasContext('myCanvas');
        ctx.setIsMainContext = function () { };
        ctx.clear = function () { };
        ctx.clip = function () { };
        adptDrawImage(ctx);
        ctx.measureText = function (text) {
          if (app.measureText) {
            return app.measureText(text, ctx.font)
          } else {
            return { width: text.length * 12, height: 12 };
          }
        }
        ctx.transform = function (a, b, c, d, tx, ty) {
          var sx = NaN, sy = NaN;
          var rotate = NaN;
          var angle = Math.atan2(b, a);
          rotate = angle / 0.0174532922222222;
          sx = Math.sqrt(a * a + b * b);
          sy = Math.sqrt(c * c + d * d);
          var cx = 0;
          cx = Math.cos(angle);
          if (cx != 0) {
            sy = d / cx;
          } else {
            sy = -c / Math.sin(angle);
          };

          this.translate(tx, ty)

          this.rotate(angle)
          this.scale(sx, sy)
        };
        makeSetProperty(ctx, "fillStyle", "setFillStyle", "_fillStyle");
        makeSetProperty(ctx, "textAlign", "setTextAlign", "_textAlign");
        makeSetProperty(ctx, "textBaseline", "setTextBaseline", "_textBaseline");
        adptCtx(ctx)
        return ctx;
      }
      rst.style = {};

    }
    rst.appendChild = function () { };
    rst.addEventListener = function () { };
    rst.style = {};
    return rst;
  }
  document.addEventListener = function () { };;
}

