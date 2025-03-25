import tailwindcss from '@tailwindcss/vite';
import react from '@vitejs/plugin-react';
import laravel from 'laravel-vite-plugin';
import { resolve } from 'node:path';
import { defineConfig } from 'vite';
<<<<<<< HEAD
import crypto from 'crypto';
 
 
 global.crypto = crypto;
=======
>>>>>>> 26460b601358339c74ba0b0ae34aad95df8f6287

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.tsx'],
            ssr: 'resources/js/ssr.tsx',
            refresh: true,
        }),
        react(),
        tailwindcss(),
    ],
    esbuild: {
        jsx: 'automatic',
    },
    resolve: {
        alias: {
            'ziggy-js': resolve(__dirname, 'vendor/tightenco/ziggy'),
        },
    },
<<<<<<< HEAD
	    server: {
        host: 'app', // Make Vite accessible on all IP addresses
        port: 5173,       // Default Vite port
	cors:{
	origin: '*'
	},
		hmr: {
            host: '196.188.63.81',
        },
		proxy: {
      //'/app': 'http://localhost',  // Proxy API requests to Laravel backend
    },
    },
});

=======
});
>>>>>>> 26460b601358339c74ba0b0ae34aad95df8f6287
