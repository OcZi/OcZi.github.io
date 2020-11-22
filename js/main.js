
// Momento Javascript
function palindrome(text) {
    text = text.replace(/\s/g, "").toLowerCase();
    let result = text.split("").reverse().join("");
    return text === result;
}

document.write("is palindrome: " + palindrome("Amad a la dama"));
console.log(palindrome("Amad a la dama"));