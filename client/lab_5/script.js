async function mainEvent() {
  const form = document.querySelector('.box');
  form.addEventListener('submit', async (submitEvent) => {
    submitEvent.preventDefault();
    console.log('form submission');
    const results = await fetch('https://data.princegeorgescountymd.gov/resource/umjn-t2iz.json');
    const arrayFromJason = await results.json();
    console.table(arrayFromJason);
  });
}

document.addEventListener('DOMContentLoaded', async () => mainEvent());
// Lab 5
