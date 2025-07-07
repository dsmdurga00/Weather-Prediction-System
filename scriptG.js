function openLightbox(element) {
  const imgSrc = element.querySelector('img').src;
  document.getElementById('lightbox-img').src = imgSrc;
  document.getElementById('lightbox').style.display = 'flex';
}

function closeLightbox() {
  document.getElementById('lightbox').style.display = 'none';
}
