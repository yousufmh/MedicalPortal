const signIn = document.querySelector('.btn1');
const signUp = document.querySelector('.btn2');

const signInForm = document.querySelector('#singIn');
const signUpForm = document.querySelector('#signUp');

signUp.addEventListener('click',function(){
  signUp.classList.add('active');
  signIn.classList.remove('active');
  signUpForm.classList.add('show');
  signInForm.classList.remove('show');
})
signIn.addEventListener('click',function(){
  signUp.classList.remove('active');
  signIn.classList.add('active');
  signInForm.classList.add('show');
  signUpForm.classList.remove('show');
})
