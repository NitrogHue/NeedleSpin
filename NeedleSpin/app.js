async function Login() {
    const userEl = document.getElementById('username');
    const passEl = document.getElementById('password');
    if (!userEl || !passEl) return;

    const username = userEl.value;
    const password = passEl.value;
    
    if (username === "" || password === "") {
        alert("Prosím vyplň username a heslo!");
        return;
    }
    
    try {
        const response = await fetch('login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
        });
        
        const data = await response.json();
        
        if (data.success) {
            alert("Přihlášení úspěšné!");
            window.location.href = "index.html";
        } else {
            alert(data.message);
        }
    } catch (error) {
        alert("Chyba při přihlašování. Zkus to znovu.");
    }
}

async function registrace() {
    const emailEl = document.getElementById('email');
    if (!emailEl) return; 

    const email = emailEl.value;
    const username = document.getElementById('reg-username').value;
    const password = document.getElementById('reg-password').value;
    const password2 = document.getElementById('reg-password2').value;
    
    if (email === "" || username === "" || password === "" || password2 === "") {
        alert("Prosím vyplň všechna pole!");
        return;
    }
    
    if (password !== password2) {
        alert("Hesla se neshodují!");
        return;
    }
    
    try {
        const response = await fetch('registrace.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `email=${encodeURIComponent(email)}&username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
        });
        
        const data = await response.json();
        
        if (data.success) {
            alert("Registrace úspěšná! Vítej " + username);
            window.location.href = "login.html";
        } else {
            alert(data.message);
        }
    } catch (error) {
        alert("Chyba při registraci. Zkus to znovu.");
    }
}

async function zmenaJmena() {
    const newUsername = document.getElementById('new-username').value;
    const password = document.getElementById('username-password').value;
    
    if (newUsername === "" || password === "") {
        alert("Prosím vyplň obě pole!");
        return;
    }
    
    try {
        const response = await fetch('Change.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `action=change_username&new_username=${encodeURIComponent(newUsername)}&password=${encodeURIComponent(password)}`
        });
        
        const data = await response.json();
        
        if (data.success) {
            alert("Username úspěšně změněn!");
            location.reload();
        } else {
            alert(data.message);
        }
    } catch (error) {
        alert("Chyba při změně username. Zkus to znovu.");
    }
}

async function zmenaHesla() {
    const oldPassword = document.getElementById('old-password').value;
    const newPassword = document.getElementById('new-password').value;
    const newPassword2 = document.getElementById('new-password2').value;
    
    if (oldPassword === "" || newPassword === "" || newPassword2 === "") {
        alert("Prosím vyplň všechna pole!");
        return;
    }
    
    if (newPassword !== newPassword2) {
        alert("Nová hesla se neshodují!");
        return;
    }
    
    try {
        const response = await fetch('Change.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `action=change_password&old_password=${encodeURIComponent(oldPassword)}&new_password=${encodeURIComponent(newPassword)}`
        });
        
        const data = await response.json();
        
        if (data.success) {
            alert("Heslo úspěšně změněno!");
            document.getElementById('old-password').value = '';
            document.getElementById('new-password').value = '';
            document.getElementById('new-password2').value = '';
        } else {
            alert(data.message);
        }
    } catch (error) {
        alert("Chyba při změně hesla. Zkus to znovu.");
    }
}

function odhlasit() {
    if (confirm("Opravdu se chceš odhlásit?")) {
        window.location.href = "odhlaseni.php";
    }
}


let currentPage = 1;      
let currentQuery = '';    
let isLoading = false;    
let hasMoreData = true;   

async function loadAlbums(query, isNewSearch = false) {
    const grid = document.getElementById('resultsGrid');
    if (!grid) return; 

    if (isNewSearch) {
        currentPage = 1;
        currentQuery = query;
        hasMoreData = true;
        grid.innerHTML = ''; 
    }

    if (isLoading || !hasMoreData) return;

    isLoading = true; // Zámek

    // Spinner jen pro první stranu
    if (currentPage === 1) {
        grid.innerHTML = '<div class="col-12 text-center text-white mt-5" id="loading-spinner"><h4>Načítám hudbu...</h4></div>';
    }

    try {
        const response = await fetch(`search.php?q=${encodeURIComponent(currentQuery)}&page=${currentPage}`);
        const data = await response.json();

        // Odstraníme spinner
        const spinner = document.getElementById('loading-spinner');
        if (spinner) spinner.remove();

        if (data.results && data.results.length > 0) {
            
            data.results.forEach(album => {
                const img = album.cover_image || album.thumb || 'https://placehold.co/300x300?text=No+Cover';
                const title = album.title; 
                // ID pro odkaz (Discogs master_id nebo id)
                const id = album.master_id || album.id; 

                const cardHtml = `
                    <div class="col-6 col-md-4 col-lg-3 fade-in">
                        <div class="card bg-dark text-white border-secondary h-100 shadow-sm clickable-card" 
                             onclick="window.location.href='album.html?id=${id}'" 
                             style="cursor: pointer; transition: transform 0.2s;"
                             onmouseover="this.style.transform='scale(1.05)'"
                             onmouseout="this.style.transform='scale(1)'">
                            <img src="${img}" class="card-img-top p-2" alt="${title}" style="object-fit: cover; aspect-ratio: 1/1;">
                            <div class="card-body p-2 text-center">
                                <h6 class="card-title text-truncate small">${title}</h6>
                                <span class="badge bg-secondary rounded-pill">Detail alba</span>
                            </div>
                        </div>
                    </div>
                `;
                grid.innerHTML += cardHtml;
            });

            currentPage++;

            if (data.pagination && currentPage > data.pagination.pages) {
                hasMoreData = false;
            }

        } else {
            if (currentPage === 1) {
                grid.innerHTML = '<div class="col-12 text-center text-white">Nebylo nic nalezeno.</div>';
            }
            hasMoreData = false;
        }

    } catch (error) {
        console.error(error);
        if (currentPage === 1) {
             grid.innerHTML = '<div class="col-12 text-center text-danger">Chyba při komunikaci se serverem.</div>';
        }
    } finally {
        isLoading = false; 
    }
}

document.addEventListener('DOMContentLoaded', function() {
    
    const grid = document.getElementById('resultsGrid');
    if (grid) {
        loadAlbums('', true); 
    }

    const searchInput = document.getElementById('search-input');
    const searchBtn = document.getElementById('search-btn');

    if (searchBtn && searchInput) {
        searchBtn.addEventListener('click', function() {
            loadAlbums(searchInput.value, true); 
        });

        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                loadAlbums(searchInput.value, true); 
            }
        });
    }

    window.addEventListener('scroll', () => {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 100) {
            loadAlbums(currentQuery, false); 
        }
    });
});