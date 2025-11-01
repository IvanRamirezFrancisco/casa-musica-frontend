# Usar Node.js 18 Alpine para una imagen más ligera
FROM node:18-alpine

# Instalar git para posibles dependencias
RUN apk add --no-cache git

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar todas las dependencias (NO usar --only=production)
RUN npm ci --include=dev

# Copiar todo el código fuente
COPY . .

# Construir la aplicación para producción
RUN npm run build:prod

# Limpiar devDependencies después del build para reducir tamaño
RUN npm prune --omit=dev

# Exponer puerto (Railway asigna automáticamente)
EXPOSE 3000

# Comando para iniciar la aplicación con SSR
CMD ["npm", "start"]