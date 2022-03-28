/* eslint-disable max-len */
/* eslint-disable no-multi-spaces */
function getRandomIntInclusive(min, max) {
  const newMin = Math.ceil(min);
  const newMax = Math.floor(max);
  return Math.floor(
    Math.random() * (newMax - newMin + 1) + newMin
  );
}

function restoArrayMake(dataArray) {
  // console.log('data handler');
  // console.table(dataArray);
  const range = [...Array(15).keys()];
  const listItems = range.map((item, index) => {
    const restNum = getRandomIntInclusive(0, dataArray.length - 1);
    return dataArray[restNum];
  });
    // console.log(listItems);
  return listItems;
  // range.forEach((item) => {
  //   console.log('range item', item);
  // });
}

function createHtmlList(collection) {
  // console.log('fired HTML creator')
//   console.log(collection);
  const targetList = document.querySelector('.resto-list');
  targetList.innerHTML = '';
  collection.forEach((item) => {
    const {name} = item;
    const displayName = name.toLowerCase();
    const injectThisItem =  `<li>${displayName}</li>`;
    targetList.innerHTML += injectThisItem;
  });
}

async function mainEvent() { // the async keyword means we can make API requests
  const form = document.querySelector('.box');
  const submit = document.querySelector('.button');
  const resto = document.querySelector('#resto_name');
  const zipcode = document.querySelector('#zip_code');
  submit.style.display = 'none';
  const results = await fetch('/api/foodServicesPG'); // This accesses some data from our API
  const arrayFromJson = await results.json(); // This changes it into data we can use - an object
  if (arrayFromJson.data.length > 0) { // This if statement is to prevent a race condition on data load
    submit.style.display = 'block';

    let currentArray = [];
    resto.addEventListener('input', async (event) => {
      console.log(event.target.value);
      const selectedResto = arrayFromJson.data.filter((item) => {
        const lowerName = item.name.toLowerCase();
        const lowerValue = event.target.value.toLowerCase();
        return lowerName.includes(lowerValue);
      });
      createHtmlList(selectedResto);
    });

    zipcode.addEventListener('input', async (event) => {
      console.log(event.target.value);
      const selectedZip = arrayFromJson.data.filter((item) => {
        const lowerName = item.name.toLowerCase();
        const lowerValue = event.target.value.toLowerCase();
        return lowerName.includes(lowerValue);
      });
      createHtmlList(selectedZip);
    });

    //   console.log(matchResto);

    form.addEventListener('submit', async (submitEvent) => { // async has to be declared all the way to get an await
      submitEvent.preventDefault(); // This prevents your page from refreshing!
      //   console.log('form submission'); // this is substituting for a "breakpoint"
      console.table(arrayFromJson.data); // this is called "dot notation"
      // arrayFromJson.data - we're accessing a key called 'data' on the returned object
      // it contains all 1,000 records we need
      currentArray = restoArrayMake(arrayFromJson.data);
      console.log(currentArray);
      createHtmlList(currentArray);
    });
  }
}

// this actually runs first! It's calling the function above
document.addEventListener('DOMContentLoaded', async () => mainEvent()); // the async keyword means we can make API requests
