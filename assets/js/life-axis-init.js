(function () {
  'use strict';
  
  console.log('%c[Life Axis]%c Premium Game Server Theme v1.15.1 initialized', 
    'background: #8b5cf6; color: #fff; font-weight: bold; padding: 2px 6px; border-radius: 4px;',
    'color: #06b6d4; font-weight: bold;'
  );

  document.addEventListener('DOMContentLoaded', () => {
    // Add custom branding header if missing
    const navLogo = document.querySelector('.navigation-logo, .brand-wrapper');
    if (navLogo && !navLogo.classList.contains('life-axis-branded')) {
      navLogo.classList.add('life-axis-branded');
      navLogo.innerHTML = `
        <div style="display: flex; align-items: center; gap: 10px;">
          <div style="width: 32px; height: 32px; border-radius: 8px; background: linear-gradient(135deg, #8b5cf6, #06b6d4); display: flex; align-items: center; justify-content: center; box-shadow: 0 0 15px rgba(139,92,246,0.5);">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
          </div>
          <div style="display: flex; flex-direction: column;">
            <span style="font-weight: 700; font-size: 15px; letter-spacing: -0.3px; color: #fff; line-height: 1;">Life Axis</span>
            <span style="font-size: 9px; color: #94a3b8; letter-spacing: 0.5px; text-transform: uppercase;">Infrastructure</span>
          </div>
        </div>
      `;
    }
  });
})();