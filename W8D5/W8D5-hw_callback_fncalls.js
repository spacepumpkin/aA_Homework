
// ! Simple Timeout

// window.setTimeout( () => alert('HAMMERTIME'), 1000);
// window.setTimeout( function() { alert('HAMMERTIME') }, 1000);

//######################################################################

// ! Timeout Plus Closure

function hammerTime(time) {
    window.setTimeout( () => alert(`${time} is HAMMERTIME!`), 1000);
}

// hammerTime('every time'); // alert 'every time is HAMMERTIME!'

//######################################################################

// ! Tea and Biscuits - Reader

// const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

function teaAndBiscuits () {
    let first, second; 

    reader.question('Would you like some tea? ', (res) => {
        first = res;
        console.log(`You replied ${res}.`);
        reader.question('Would you like some biscuits? ', (res) => {
            second = res;
            console.log(`You replied ${res}.`);
            reader.close();
            const firstRes = (first === "yes" || /^[yY]/.test(first) ) ? "do" : "don't";
            const secondRes = (second === "yes" || RegExp('^[yY]$').test(first) ) ? "do" : "don't";
            console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`)
        })
    })
}

// teaAndBiscuits();

//######################################################################

// ! Ways to Call a Function

function Cat() {
    this.name = 'Markov';
    this.age = 3;
}

function Dog() {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
    // debugger
};

const Markov = new Cat();
const Noodles = new Dog();

// Basic Method Style - #chase on Noodles, passing in Markov
Noodles.chase(Markov); // this == Noodles

// Call Style - Noodle's #chase method on Markov, passing in Noodles
Noodles.chase.call(Markov, Noodles) // this == Markov

// Apply Style - Noodle's #chase method on Markov, passing in Noodles as array
Noodles.chase.apply(Markov, [Noodles]) // this == Markov








