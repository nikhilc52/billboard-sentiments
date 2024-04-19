function updateImage() {
    var frameID = document.getElementById("yearID").value;
    var imageName = "sliders/energy_danceability/" + frameID + ".png";
    document.getElementById("imageToChange").src = imageName;
}