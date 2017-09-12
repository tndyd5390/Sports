var slideLeft = new Menu({wrapper: '#wrapper', type: 'slide-left', menuOpenerClass: '.c-button', maskId: '#c-mask'});

var slideLeftBtn = document.querySelector('#c-button--slide-left');

slideLeftBtn.addEventListener('click', function(e) {
  e.preventDefault;
  slideLeft.open();
});
