function start_Cloud_Animation()
{
  $(window).scroll(function()
  {
    if ($(this).scrollTop() > 300)
    {
        $(".cloud-1").animate({left: "65%"}, 3200);
        $(".cloud-2").animate({left: "8%"}, 3200);
        $(".cloud-3").animate({left: "69%"}, 3200);
        $(".cloud-4").animate({right: "70%"}, 4200);
        $(".cloud-5").animate({left: "52%"}, 3200);
        $(".cloud-6").animate({left: "68%"}, 4200);
    }
  });
}
