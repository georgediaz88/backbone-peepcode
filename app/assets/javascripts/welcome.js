// $(document).ready(function() {

//   Screencast = Backbone.Model.extend({
//     url: function(){
//       return "/videos/" + this.get('id') + ".json";
//     }
//   });
//   // var screencast = new Screencast();
//   // screencast.url = "/videos/2.json";

//   // screencast.fetch({
//   //   success: function(){
//   //     view = new ScreencastView({model: screencast});
//   //     $("ul").append(view.render());
//   //     console.log(screencast.get("title"));
//   //   }
//   // });

//   // ..................

//   var Screencasts = Backbone.Collection.extend({
//     model: Screencast
//   });
//   var screencasts = new Screencasts();
//   screencasts.url = "/videos.json";

//   screencasts.fetch({
//       success: function(){
//           screencasts_view = new ScreencastsView({});
//         _.each(screencasts.models, function(model) {
//           screencasts_view.addOne(model);
//         });
//       }
//   });

// // .........

// var ScreencastsView = Backbone.View.extend({
//   el: ".screencasts",
//   addOne: function(model){
//     console.log(model);
//     view = new ScreencastView({model: model});
//     if (model.get('watched') === true) { $(view.el).addClass('watched');}
//     $(this.el).append(view.render());
//     var img = $('<img />').attr('src', model.get('image'));
//     $(view.el).append(img);
//   }
// });
// //..........

//   var ScreencastView = Backbone.View.extend({
//     tagName: "li",
//     events: {
//       "click" : "toggleWatched"
//     },
//     toggleWatched: function() {
//       if (this.model.get('watched') === true) {
//         this.model.set({"watched": false}).save();
//       } else {
//         this.model.set({"watched": true}).save();
//       }
//       $(this.el).toggleClass("watched");
//     },
//     render: function() {
//       return $(this.el).text(this.model.get('title'));
//     }

//   });

// });