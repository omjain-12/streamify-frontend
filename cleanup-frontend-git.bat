@echo off
REM StreamHub Frontend - Complete Git History Cleanup Script (Windows)
REM This script removes ALL git history and creates a fresh repository

echo 🎨 Starting complete Git history cleanup for StreamHub Frontend...
echo ⚠️  WARNING: This will permanently delete ALL git history!
echo.

set /p choice=Are you sure you want to proceed? (yes/no): 
if /i "%choice%" neq "yes" (
    if /i "%choice%" neq "y" (
        echo Cleanup cancelled.
        exit /b 1
    )
)

echo.
echo 🔄 Step 1: Removing existing Git repository...

REM Remove the entire .git directory
if exist ".git" (
    rmdir /s /q ".git"
    echo ✅ Removed .git directory
) else (
    echo ℹ️  No .git directory found
)

REM Remove .gitignore to create a fresh one
if exist ".gitignore" (
    del ".gitignore"
    echo ✅ Removed old .gitignore
)

echo.
echo 🔄 Step 2: Creating fresh .gitignore for React/Vite frontend...

REM Create a comprehensive .gitignore for React/Vite project
(
echo # Dependencies
echo node_modules/
echo .pnp
echo .pnp.js
echo npm-debug.log*
echo yarn-debug.log*
echo yarn-error.log*
echo pnpm-debug.log*
echo.
echo # Production builds
echo /dist
echo /build
echo /.next
echo /out
echo.
echo # Environment variables
echo .env
echo .env.local
echo .env.development.local
echo .env.test.local
echo .env.production.local
echo .env.production
echo.
echo # IDE and Editor files
echo .vscode/
echo .idea/
echo *.swp
echo *.swo
echo *~
echo.
echo # OS generated files
echo .DS_Store
echo .DS_Store?
echo ._*
echo .Spotlight-V100
echo .Trashes
echo ehthumbs.db
echo Desktop.ini
echo Thumbs.db
echo.
echo # Vite specific
echo dist/
echo dist-ssr/
echo *.local
echo.
echo # React specific
echo /coverage
echo /.nyc_output
echo.
echo # ESLint cache
echo .eslintcache
echo.
echo # Prettier cache
echo .prettiercache
echo.
echo # Logs
echo logs/
echo *.log
echo.
echo # Runtime data
echo pids/
echo *.pid
echo *.seed
echo *.pid.lock
echo.
echo # Dependency directories
echo jspm_packages/
echo.
echo # Optional npm cache directory
echo .npm
echo.
echo # Optional REPL history
echo .node_repl_history
echo.
echo # Output of 'npm pack'
echo *.tgz
echo.
echo # Yarn Integrity file
echo .yarn-integrity
echo.
echo # parcel-bundler cache
echo .cache
echo .parcel-cache
echo.
echo # Storybook build outputs
echo .out
echo .storybook-out
echo storybook-static/
echo.
echo # Temporary folders
echo tmp/
echo temp/
echo.
echo # Testing
echo /coverage
echo /.nyc_output
echo /cypress/videos
echo /cypress/screenshots
echo.
echo # Miscellaneous
echo *.tsbuildinfo
echo.
echo # Local env files
echo .env*.local
echo.
echo # Vercel
echo .vercel
echo.
echo # Turbo
echo .turbo
echo.
echo # StreamHub Frontend specific
echo /public/uploads
echo /src/assets/temp
) > .gitignore

echo ✅ Created comprehensive .gitignore for React frontend

echo.
echo 🔄 Step 3: Initializing fresh Git repository...

REM Initialize new git repository
git init

echo ✅ Initialized fresh Git repository

echo.
echo 🔄 Step 4: Setting up initial commit...

REM Configure git with generic info
git config user.name "StreamHub Frontend Developer"
git config user.email "frontend@streamhub.platform"

REM Add all files to staging
git add .

REM Create initial commit with StreamHub branding
git commit -m "🎨 Initial commit: StreamHub Frontend v2.0.0

✨ Features:
- Modern React.js frontend application
- Responsive video streaming interface
- Advanced user interaction components
- Real-time notifications system
- Mobile-first responsive design
- Content discovery and search
- User profile management
- Social engagement features

🛠️ Tech Stack:
- React.js 18+ with Hooks
- Vite for fast development
- Tailwind CSS for styling
- Axios for API communication
- React Router for navigation
- Modern UI/UX components
- Progressive Web App features

🎯 Architecture:
- Component-based architecture
- Custom hooks for state management
- Optimized performance
- Accessibility compliant
- SEO optimized

🚀 Built with modern frontend best practices"

echo ✅ Created initial commit

echo.
echo 🔄 Step 5: Cleaning up temporary files...

REM Remove any potential traces
del /q "*.orig" 2>nul
del /q "*.rej" 2>nul
del /q ".DS_Store" 2>nul

echo ✅ Cleaned up temporary files

echo.
echo 🎉 Frontend Git history cleanup completed successfully!
echo.
echo 📋 Summary:
echo   ✅ Removed all previous Git history
echo   ✅ Created fresh repository
echo   ✅ Added React/Vite specific .gitignore
echo   ✅ Made initial commit as StreamHub Frontend
echo   ✅ Cleaned up temporary files
echo.
echo 🔐 Your frontend repository is now completely clean and shows as:
echo    📅 Created: %date% %time%
echo    👤 Author: StreamHub Frontend Developer
echo    💬 Message: StreamHub Frontend v2.0.0
echo.
echo 🚀 Next steps:
echo    1. Review and update git config if needed:
echo       git config user.name "Your Name"
echo       git config user.email "your.email@example.com"
echo.
echo    2. Add remote repository (if you have one):
echo       git remote add origin ^<your-frontend-repo-url^>
echo.
echo    3. Push to your repository:
echo       git push -u origin main
echo.
echo ✨ Your StreamHub Frontend is ready!

pause
