// FUNCTION FOR FAQ ACCORDION

const faqHeads = document.querySelectorAll('.faq__head');
const faqSections = document.querySelectorAll('.faq__body');

faqSections.forEach(section => {
  section.setAttribute('aria-hidden', true);
  section.classList.remove('open');
});

faqHeads.forEach(accordion => {
  accordion.setAttribute('aria-expanded', false);

  const expanded = accordion.getAttribute('aria-expanded');
  const number = accordion
    .getAttribute('id')
    .split('-')
    .pop();
  const associatedSection = document.getElementById(`faq-body-${number}`);

  accordion.addEventListener('click', () => {
    accordion.classList.toggle('expanded');
    associatedSection.classList.toggle('open');
    if (accordion.classList.contains('expanded')) {
      accordion.setAttribute('aria-expanded', true);
      associatedSection.setAttribute('aria-hidden', false);
    } else {
      accordion.setAttribute('aria-expanded', false);
      associatedSection.setAttribute('aria-hidden', true);
    }
  });
});

// FUNCTION FOR FAQ SEARCH
const search = () => {
  const input = document.getElementById('search-input');
  const filter = input.value.toLowerCase();
  const faqGroup = document.getElementById('faq-group');
  const faqContent = faqGroup.getElementsByTagName('section');

  for (let i = 0; i < faqContent.length; i++) {
    const a = faqContent[i].getElementsByTagName('h4')[0];
    const textValue = a.textContent || a.innerText;
    if (textValue.toLowerCase().indexOf(filter) > -1) {
      faqContent[i].style.display = '';
    } else {
      faqContent[i].style.display = 'none';
    }
  }
};
