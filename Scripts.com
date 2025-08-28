<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loja de Scripts</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a0dad, #1e90ff);
        color: #fff;
        margin: 0;
        padding: 0;
    }
    header {
        text-align: center;
        padding: 20px;
        background-color: rgba(0,0,0,0.2);
    }
    h1 {
        margin: 0;
    }
    .products {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin: 20px;
    }
    .product {
        background-color: rgba(255,255,255,0.1);
        border-radius: 10px;
        margin: 10px;
        padding: 20px;
        width: 200px;
        text-align: center;
    }
    button {
        background-color: #fff;
        color: #6a0dad;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #ddd;
    }
    #cart {
        position: fixed;
        right: 20px;
        top: 20px;
        background-color: rgba(0,0,0,0.3);
        padding: 10px;
        border-radius: 10px;
    }
</style>
</head>
<body>

<header>
    <h1>Loja de Scripts</h1>
</header>

<div class="products">
    <div class="product">
        <h3>Script 1</h3>
        <p>R$50,00</p>
        <button onclick="addToCart('Script 1', 50)">Adicionar ao Carrinho</button>
    </div>
    <div class="product">
        <h3>Script 2</h3>
        <p>R$70,00</p>
        <button onclick="addToCart('Script 2', 70)">Adicionar ao Carrinho</button>
    </div>
</div>

<div id="cart">
    <h4>Carrinho</h4>
    <ul id="cart-items"></ul>
    <p>Total: R$<span id="total">0</span></p>
    <button onclick="checkout()">Pagar via Pix</button>
</div>

<script>
let cart = [];
let total = 0;

function addToCart(name, price) {
    cart.push({name, price});
    total += price;
    renderCart();
}

function renderCart() {
    const cartItems = document.getElementById('cart-items');
    cartItems.innerHTML = '';
    cart.forEach(item => {
        let li = document.createElement('li');
        li.textContent = item.name + ' - R$' + item.price;
        cartItems.appendChild(li);
    });
    document.getElementById('total').textContent = total;
}

function checkout() {
    if(cart.length === 0){
        alert('Seu carrinho está vazio!');
        return;
    }
    let pix = "14125287988"; // seu Pix
    alert("Para concluir a compra, faça o pagamento via Pix: " + pix + "\nTotal: R$" + total);
}
</script>

</body>
</html>
