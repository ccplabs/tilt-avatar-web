import { defineConfig } from 'vite'
import reactRefresh from '@vitejs/plugin-react-refresh'

export default defineConfig({

  // ↓↓↓ change to logLevel: 'info' ↓↓↓
  logLevel: 'info',
  // ↑↑↑ change to logLevel: 'info' ↑↑↑

  plugins: [reactRefresh()],
  server: {
    host: process.env.VITE_HOST || '127.0.0.1',
    port: process.env.VITE_PORT || 8080,
    hmr: {
      clientPort: process.env.VITE_CLIENT_PORT || null
    },
    proxy: {
      '^/api': {
        target: process.env.API_URL || 'http://127.0.0.1:1337',
        changeOrigin: true
      }
    }
  }
})