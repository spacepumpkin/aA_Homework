// ! Phase 1 - JS Fundamentals

// ! Mystery Scoping with var, let, const

function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in block x 2

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in block, out block

// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//         var x = 'in block';
//         console.log(x);
//     }
//     console.log(x);
// } // error, x already declared

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
} // in block, out block

// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//         let x = 'in block';
//         console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
// } // error, x already declared



// ! madLib

// Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
function madLib(verb, adjective, noun) {
    // debugger
    verb = verb.toUpperCase();
    adjective = adjective.toUpperCase();
    noun = noun.toUpperCase();
    console.log(`We shall ${verb} the ${adjective} ${noun}.`);
    // console.log(x);
};

// madLib('make', 'best', 'guac'); // "We shall MAKE the BEST GUAC."



// ! isSubstring

// Input 1) A String, called searchString. 2) A String, called subString
// Output: A Boolean.true if the subString is a part of the searchString.

function isSubstring(searchString, subString) {
    // can't break out of forEach; should use for loop instead

    // let res;
    // searchString.split(" ").forEach( function(subStr) {
    //     if (subStr === subString) {
    //         res = true;
    //     }
    // })
    // if (res !== true) res = false;

    // or we can use for-of
    // for (let str of searchString.split(" ")) {
    //     if (str === subString) {
    //         console.log(true);
    //         return true;
    //     }
    // }
    // console.log(false);
    // return false;

    // let res = RegExp(subString).test(searchString); // RegEx .test
    // console.log(res);
    // return res;

    return searchString.includes(subString); // .includes
};

console.log( isSubstring("time to program", "time") ); // true
console.log( isSubstring("Jump for joy", "joys") ); // false


//######################################################################

// ! Phase 2 - JS Looping Constructs

// ! fizzBuzz

// Define a function fizzBuzz(array) that takes an array and returns a new array 
// of every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(array) {
    let divisible = [];
    let div3, div5;
    array.forEach( (num) => {
        div3 = (num % 3 == 0);
        div5 = (num % 5 == 0);

        // if ( (div3 || div5) && !(div3 && div5) ) {
        //     divisible.push(num);
        // }
        if ( div3 ^ div5 ) {
            divisible.push(num);
        }
    })
    return divisible;
}

// console.log( fizzBuzz([1,2,3,4,5,6,7,8,9,10,15]) ); // [3, 5, 6, 9, 10]

// ! isPrime

// Define a function isPrime(number) that returns true if number is prime. 
// Otherwise, false. Assume number is a positive integer.

function isPrime(num) {
    if (num <= 1) {
        return false;
    } 
    for (let i = 2; i < num; i++) {
        if (num % i === 0) { return false };
    }
    return true;
}

// console.log( isPrime(2) ) // true
// console.log( isPrime(10) ) // false
// console.log( isPrime(15485863) ) // true
// console.log( isPrime(3548563) ) // false

// ! sumOfNPrimes

// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of 
// the first n prime numbers. Hint: use isPrime as a helper method.

function sumOfNPrimes(n) {
    let sum = 0;
    let currentNum = 2;
    let i = 0;

    while (i < n) {
        if (isPrime(currentNum)) {
            sum += currentNum;
            i++;
        }
        currentNum++;
    }

    return sum;
}

// console.log( sumOfNPrimes(0) ) // 0
// console.log( sumOfNPrimes(1) ) // 2
// console.log( sumOfNPrimes(4) )// 17

//######################################################################