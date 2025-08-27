# Loja estática — PIX somente

Este pacote cria uma loja simples com **pagamento exclusivo via PIX** (QR e Copia-e-Cola), carregando produtos de `products.json`.

## Como usar
1. Abra `index.html` no seu computador para testar.
2. Antes de vender de verdade, **edite os campos no checkout**:
   - **Chave PIX do vendedor**
   - **Nome do recebedor** (máx. 25 chars)
   - **Cidade** (máx. 15 chars, use CAIXA ALTA sem acentos)
3. Edite `products.json` para alterar/Adicionar produtos (título, preço, imagem etc.).
4. Publique os arquivos em um host estático (Netlify, Vercel, GitHub Pages, Cloudflare Pages ou seu servidor).

## Sobre os produtos
Incluímos um produto real como exemplo (título e preço do dia em que este pacote foi gerado) e mais dois modelos para você substituir. 
**Imagens**: troque os placeholders em `assets/` pelas suas imagens (mesmo nome do arquivo ou ajuste `products.json`).

## Como funciona o PIX
O botão **Gerar QR PIX** monta o payload BR Code (EMV) com:
- GUI `br.gov.bcb.pix`
- Chave PIX
- Nome/Cidade do recebedor
- TXID
- Valor total do carrinho

O QR e o “Copia e Cola” são gerados localmente no navegador. **Não há gateway**.

> Dica: some um webhook/validação manual depois do pagamento (por enquanto é autoatendimento).

## Aviso legal
Respeite sempre os termos de uso e as leis aplicáveis aos produtos vendidos. Evite infringir direitos autorais e regras de plataformas de jogos.
