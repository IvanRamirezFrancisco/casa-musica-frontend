const express = require('express');
const path = require('path');
const app = express();

// Servir archivos estáticos desde dist/casa-musica-frontend/browser
app.use(express.static(path.join(__dirname, 'dist/casa-musica-frontend/browser')));

// Todas las rutas devuelven index.html (para routing de Angular)
app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist/casa-musica-frontend/browser/index.html'));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor ejecutándose en puerto ${PORT}`);
});