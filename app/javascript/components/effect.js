const hero = document.querySelector('.hero');
const text = document.querySelector('.header_h1');
const walk = 100; // 100px

const shadow = (e) => {
  // const width = hero.offsetWidth;
  // const height = hero.offsetHeight;
  // destructuring
  const {offsetWidth: width, offsetHeight: height} = hero;

  let {offsetX: x, offsetY:y} = e;

  if (this != e.target) {
    x = x + e.target.offsetLeft;
    y = y + e.target.offsetTop;
  }

  const xWalk = (x / width * walk) - (walk / 2);
  const yWalk = (y / height * walk) - (walk / 2);

  text.style.textShadow = `
    ${xWalk}px ${yWalk}px 0 rgba(255,255,255,.3)
    `;

    // ${xWalk * -1}px ${yWalk}px 0 rgba(0,0,0,.3)
}

hero.addEventListener('mousemove', shadow());

export { shadow };