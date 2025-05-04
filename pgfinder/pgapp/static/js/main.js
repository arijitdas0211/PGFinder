<<<<<<< HEAD
// TypesWriter JS
var TxtType = function (el, toRotate, period) {
  this.toRotate = toRotate;
  this.el = el;
  this.loopNum = 0;
  this.period = parseInt(period, 10) || 1000;
  this.txt = '';
  this.tick();
  this.isDeleting = false;
};

TxtType.prototype.tick = function () {
  var i = this.loopNum % this.toRotate.length;
  var fullTxt = this.toRotate[i];

  if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
  } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
  }

  this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

  var that = this;
  var delta = 200 - Math.random() * 100;

  if (this.isDeleting) { delta /= 2; }

  if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
  } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
  }

  setTimeout(function () {
    that.tick();
  }, delta);
};

window.onload = function () {
  var elements = document.getElementsByClassName('typewrite');
  for (var i = 0; i < elements.length; i++) {
    var toRotate = elements[i].getAttribute('data-type');
    var period = elements[i].getAttribute('data-period');
    if (toRotate) {
      new TxtType(elements[i], JSON.parse(toRotate), period);
    }
  }
  // INJECT CSS
  var css = document.createElement("style");
  // css.type = "text/css";
  css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #000000 }";
  document.body.appendChild(css);
};

// Datatable
const select = (el, all = false) => {
  el = el.trim()
  if (all) {
    return [...document.querySelectorAll(el)]
  } else {
    return document.querySelector(el)
  }
}

const datatables = select('.datatable', true)
datatables.forEach(datatable => {
  new simpleDatatables.DataTable(datatable);
})
// Datatable

// User star rating
$(document).ready(function () {
  a = $('#one')
  b = $('#two')
  c = $('#three')
  d = $('#four')
  e = $('#five')
  x = 0

  $(a).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "initial")
    $(c).css("color", "initial")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 1
  })
  $(b).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "initial")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 2
  })
  $(c).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 3
  })
  $(d).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "#FFBB00")
    $(e).css("color", "initial")
    x = 4
  })
  $(e).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "#FFBB00")
    $(e).css("color", "#FFBB00")
    x = 5
  })
  $('.val').click(function () {
    // console.log(x)
    var score = x
    $('#val').attr("value", score);
  })
});

// OWL Carousel
$(document).ready(function () {

  $("#owl-demo").owlCarousel({

    //Basic Speeds
    slideSpeed: 200,
    paginationSpeed: 1000,

    autoPlay: 3000, //Set AutoPlay to 3 seconds
    goToFirst: true,
    goToFirstSpeed: 1000,

    // Navigation
    navigation: false,
    navigationText: [
      '<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#852809}</style><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/></svg>',
      '<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#852809}</style><path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/></svg>'
    ],
    pagination: true,
    paginationNumbers: false,

    // Responsive
    responsive: true,
    items: 4,
    itemsDesktop: [1199, 3],
    itemsDesktopSmall: [980, 3],
    itemsTablet: [768, 2],
    itemsMobile: [479, 1]

  });

});
=======
// TypesWriter JS
var TxtType = function (el, toRotate, period) {
  this.toRotate = toRotate;
  this.el = el;
  this.loopNum = 0;
  this.period = parseInt(period, 10) || 1000;
  this.txt = '';
  this.tick();
  this.isDeleting = false;
};

TxtType.prototype.tick = function () {
  var i = this.loopNum % this.toRotate.length;
  var fullTxt = this.toRotate[i];

  if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
  } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
  }

  this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

  var that = this;
  var delta = 200 - Math.random() * 100;

  if (this.isDeleting) { delta /= 2; }

  if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
  } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
  }

  setTimeout(function () {
    that.tick();
  }, delta);
};

window.onload = function () {
  var elements = document.getElementsByClassName('typewrite');
  for (var i = 0; i < elements.length; i++) {
    var toRotate = elements[i].getAttribute('data-type');
    var period = elements[i].getAttribute('data-period');
    if (toRotate) {
      new TxtType(elements[i], JSON.parse(toRotate), period);
    }
  }
  // INJECT CSS
  var css = document.createElement("style");
  // css.type = "text/css";
  css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #000000 }";
  document.body.appendChild(css);
};

// Datatable
const select = (el, all = false) => {
  el = el.trim()
  if (all) {
    return [...document.querySelectorAll(el)]
  } else {
    return document.querySelector(el)
  }
}

const datatables = select('.datatable', true)
datatables.forEach(datatable => {
  new simpleDatatables.DataTable(datatable);
})
// Datatable

// User star rating
$(document).ready(function () {
  a = $('#one')
  b = $('#two')
  c = $('#three')
  d = $('#four')
  e = $('#five')
  x = 0

  $(a).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "initial")
    $(c).css("color", "initial")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 1
  })
  $(b).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "initial")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 2
  })
  $(c).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "initial")
    $(e).css("color", "initial")
    x = 3
  })
  $(d).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "#FFBB00")
    $(e).css("color", "initial")
    x = 4
  })
  $(e).click(function () {
    $(a).css("color", "#FFBB00")
    $(b).css("color", "#FFBB00")
    $(c).css("color", "#FFBB00")
    $(d).css("color", "#FFBB00")
    $(e).css("color", "#FFBB00")
    x = 5
  })
  $('.val').click(function () {
    // console.log(x)
    var score = x
    $('#val').attr("value", score);
  })
});

// OWL Carousel
$(document).ready(function () {

  $("#owl-demo").owlCarousel({

    //Basic Speeds
    slideSpeed: 200,
    paginationSpeed: 1000,

    autoPlay: 3000, //Set AutoPlay to 3 seconds
    goToFirst: true,
    goToFirstSpeed: 1000,

    // Navigation
    navigation: false,
    navigationText: [
      '<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#852809}</style><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/></svg>',
      '<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#852809}</style><path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/></svg>'
    ],
    pagination: true,
    paginationNumbers: false,

    // Responsive
    responsive: true,
    items: 4,
    itemsDesktop: [1199, 3],
    itemsDesktopSmall: [980, 3],
    itemsTablet: [768, 2],
    itemsMobile: [479, 1]

  });

});
>>>>>>> 2eca7777a88013ca13c378e37888e8be0e1ba493
// End of OWL