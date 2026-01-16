<?php
session_start();
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hodnocení Hudby</title>
    <style>
        body { font-family: sans-serif; background: #1a1a1a; color: white; padding: 20px; }
        
        .item-card {
            background: #2a2a2a;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #444;
            max-width: 500px;
        }

        h3 { margin-top: 0; color: #00d2ff; }
        textarea { width: 100%; height: 60px; margin-top: 10px; background: #333; color: white; border: 1px solid #555; }
        button { margin-top: 10px; padding: 8px 15px; background: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background: #218838; }

        /* --- STYL PRO HVĚZDIČKY (CSS Magic) --- */
        .star-rating {
            display: flex;
            flex-direction: row-reverse; /* Obrácené pořadí, aby fungoval hover efekt */
            justify-content: flex-end;
        }
        .star-rating input { display: none; } /* Skryjeme radio buttony */
        .star-rating label {
            font-size: 30px;
            color: #555;
            cursor: pointer;
            transition: color 0.2s;
        }
        /* Když najedeme myší nebo je vybráno -> změň barvu na zlatou */
        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: gold;
        }
    </style>
</head>
<body>

    <h1>Hudební databáze</h1>

    <div class="item-card" id="rating-box-album-5">
        <h3>Album: The Dark Side of the Moon (ID 5)</h3>
        
        <div class="star-rating">
            <input type="radio" name="rating" id="a5-5" value="5"><label for="a5-5">★</label>
            <input type="radio" name="rating" id="a5-4" value="4"><label for="a5-4">★</label>
            <input type="radio" name="rating" id="a5-3" value="3"><label for="a5-3">★</label>
            <input type="radio" name="rating" id="a5-2" value="2"><label for="a5-2">★</label>
            <input type="radio" name="rating" id="a5-1" value="1"><label for="a5-1">★</label>
        </div>

        <textarea placeholder="Napiš komentář..."></textarea>
        
        <button onclick="odeslatHodnoceni('album', 5, 'rating-box-album-5')">Ohodnotit Album</button>
    </div>


    <div class="item-card" id="rating-box-song-12">
        <h3>Písnička: Money (ID 12)</h3>
        
        <div class="star-rating">
            <input type="radio" name="rating_s" id="s12-5" value="5"><label for="s12-5">★</label>
            <input type="radio" name="rating_s" id="s12-4" value="4"><label for="s12-4">★</label>
            <input type="radio" name="rating_s" id="s12-3" value="3"><label for="s12-3">★</label>
            <input type="radio" name="rating_s" id="s12-2" value="2"><label for="s12-2">★</label>
            <input type="radio" name="rating_s" id="s12-1" value="1"><label for="s12-1">★</label>
        </div>

        <textarea placeholder="Jak se ti líbí tenhle track?"></textarea>
        
        <button onclick="odeslatHodnoceni('song', 12, 'rating-box-song-12')">Ohodnotit Song</button>
    </div>


    <script>
        async function odeslatHodnoceni(typ, dbId, containerId) {
            const container = document.getElementById(containerId);
            const selectedStar = container.querySelector('input[type="radio"]:checked');
            
            if (!selectedStar) {
                alert("Musíš vybrat počet hvězdiček!");
                return;
            }

            const ratingValue = selectedStar.value;
            const commentValue = container.querySelector('textarea').value;

            let data = {
                rating: ratingValue,
                comment: commentValue
            };

            if (typ === 'album') {
                data.album_id = dbId;
            } else {
                data.song_id = dbId;
            }

            // Rate.php
            try {
                const response = await fetch('rate.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                const text = await response.text();
                
                try {
                    const result = JSON.parse(text);
                    
                    if (result.success) {
                        alert("✅ " + result.message);
                        container.querySelector('textarea').value = '';
                        selectedStar.checked = false;
                    } else {
                        alert("❌ Chyba: " + result.message);
                    }
                } catch (e) {
                    console.error("Server nevrátil JSON:", text);
                    alert("Chyba serveru. Podívej se do konzole.");
                }

            } catch (error) {
                console.error('Chyba sítě:', error);
                alert("Nepodařilo se spojit se serverem.");
            }
        }
    </script>

</body>
</html>