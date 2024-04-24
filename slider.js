function updateFrame(src, yearID, img) {
    var frameID = document.getElementById(yearID).value;
    var imageName = src + "/" + frameID + ".png";
    document.getElementById(img).src = imageName;
}