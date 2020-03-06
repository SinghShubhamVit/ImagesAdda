document.addEventListener("turbolinks:load", function(){
  
    var cat = document.getElementById("category");
    var sub_cat = document.getElementById("sub_category");
  
    

    $("#category").on("change", function() {
      while (sub_cat.firstChild) sub_cat.removeChild(sub_cat.firstChild);
          $.ajax({
            url: "/subs/index?cat=" + cat.value,
            type: "GET"
          })
    });

     var category = document.getElementById("category_id");
    var sub_category = document.getElementById("sub_category_id");
  
    

    $("#category_id").on("change", function() {
      while (sub_category.firstChild) sub_category.removeChild(sub_category.firstChild);
          $.ajax({
            url: "/subs/index?category=" + category.value,
            type: "GET"
          })
    });

    

   })