let wr = (msg='--------') => console.log(`${msg}`);

function factorial(n) {
  if (n < 2) return 1;
  return n * factorial(n-1); 
}


for (var i = 1; i <= 20; i++) {
  wr(`${i}. ${factorial(i)}`);
}