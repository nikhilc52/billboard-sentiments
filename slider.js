function updateImage() {
    var frameID = document.getElementById("yearID").value;
    var directory = document.getElementById("imageToChange").src.substring(0,document.getElementById("imageToChange").src.lastIndexOf("/"));
    var imageName = directory + "/" + frameID + ".png";
    document.getElementById("imageToChange").src = imageName;
}

//separate function for instances where mutliple sliders are needed on 1 page (since elements are not unique)
function updateImage2() {
    var frameID = document.getElementById("yearID2").value;
    var directory = document.getElementById("imageToChange2").src.substring(0,document.getElementById("imageToChange2").src.lastIndexOf("/"));
    var imageName = directory + "/" + frameID + ".png";
    document.getElementById("imageToChange2").src = imageName;
}