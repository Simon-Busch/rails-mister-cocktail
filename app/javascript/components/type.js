import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed-text', {
    strings: ["Find your poison..."],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };