function imgs() {
    src = this.getAttribute("src");

    if (src == "./7694-029/7694-029F.jpg") {
        s2.style.display = "block";
        i12.style.display = "block";
        container_fronte.style.display = "inline-block";
        i22.style.display = "none";
        i33.style.display = "none";

        container_testo.style.display = "block";
        container_testo.appendChild(t1);
        container.appendChild(container_testo);
        t1.style.display = "block";
        t2.style.display = "none";
        t3.style.display = "none";

        ir11.style.display = "block";
        ir22.style.display = "none";
        ir33.style.display = "none";

        t1t.style.display = "inline-block";
        t2t.style.display = "none";
        t3t.style.display = "none";

        desc1.style.display = "inline-block";
        desc2.style.display = "none";
        desc3.style.display = "none";

    } else if (src == "./7694-050/7694-050F.jpg") {
        s2.style.display = "block";
        container_fronte.style.display = "inline-block";
        i12.style.display = "none";
        i22.style.display = "block";
        i33.style.display = "none";

        container_testo.style.display = "block";
        container_testo.appendChild(t2);
        container.appendChild(container_testo);
        t2.style.display = "block";
        t1.style.display = "none";
        t3.style.display = "none";

        ir11.style.display = "none";
        ir22.style.display = "block";
        ir33.style.display = "none";

        t1t.style.display = "none";
        t2t.style.display = "inline-block";
        t3t.style.display = "none";

        desc1.style.display = "none";
        desc2.style.display = "inline-block";
        desc3.style.display = "none";

    } else {
        s2.style.display = "inline-block";
        container_fronte.style.display = "inline-block";
        i12.style.display = "none";
        i22.style.display = "none";
        i33.style.display = "block";

        container_testo.style.display = "block";
        container_testo.appendChild(t3);
        container.appendChild(container_testo);
        t3.style.display = "block";
        t1.style.display = "none";
        t2.style.display = "none";

        ir11.style.display = "none";
        ir22.style.display = "none";
        ir33.style.display = "block";

        t1t.style.display = "none";
        t2t.style.display = "none";
        t3t.style.display = "inline-block";

        desc1.style.display = "none";
        desc2.style.display = "none";
        desc3.style.display = "inline-block";
    }

}


var imgClick1;
var imgClick2;
var imgClick3;

var src;

var i12;
var i22;
var i33;

var ir11;
var ir22;
var ir33;

var t1;
var t2;
var t3;

var t1t;
var t2t;
var t3t;


var s2;

var container_fronte;
var container_testo;

var container;
var divC2;
var divC3;

var desc1;
var desc2;
var desc3;


function gestoreLoad() {
    try {

        divC2 = document.getElementById("Contents_2");
        divC3 = document.getElementById("Contents_3");
        container = document.getElementById("text");

        container_fronte = document.getElementById("imgs");
        container_testo = document.getElementById("description");

        i12 = document.getElementById("postfront_1");
        i22 = document.getElementById("postfront_2");
        i33 = document.getElementById("postfront_3");

        ir11 = document.getElementById("postretro_1");
        ir22 = document.getElementById("postretro_2");
        ir33 = document.getElementById("postretro_3");

        t1 = document.getElementById("postheader_1");
        t2 = document.getElementById("postheader_2");
        t3 = document.getElementById("postheader_3");

        t1t = document.getElementById("Contents_1");
        t2t = document.getElementById("Contents_2");
        t3t = document.getElementById("Contents_3");

        desc1 = document.getElementById("desc29");
        desc2 = document.getElementById("desc50");
        desc3 = document.getElementById("desc199");

        s2 = document.getElementById("testocartoline");

        imgClick1 = document.getElementById("img1");
        imgClick2 = document.getElementById("img2");
        imgClick3 = document.getElementById("img3");

        ir11.style.display = "none";
        ir22.style.display = "none";
        ir33.style.display = "none";

        t1.style.display = "none";
        t2.style.display = "none";
        t3.style.display = "none";
        t1t.style.display = "none";
        t2t.style.display = "none";
        t3t.style.display = "none";

        i12.style.display = "none";
        i22.style.display = "none";
        i33.style.display = "none";

        desc1.style.display = "none";
        desc2.style.display = "none";
        desc3.style.display = "none";


        imgClick1.onclick = imgs;
        imgClick2.onclick = imgs;
        imgClick3.onclick = imgs;


    } catch (e) {
        alert("gestoreLoad: " + e);
    }
}
window.onload = gestoreLoad;
