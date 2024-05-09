<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assesment 2 PABW</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    $(document).ready(function() {
        getNewsData();
        deleteNewsData();
    });

    function getNewsData() {
        $.ajax({
            url: "getBerita.php",
            type: "GET",
            dataType: "json",
            success: function(data) {
                displayNews(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error fetching news:", textStatus, errorThrown);
            }
        });
    }

    function deleteNewsData() {
  // Event delegation to handle dynamically added elements
        $('#news-container').on('click', '.delete-news', function () {
            var id = $(this).data('id'); // Get the ID from the button's data attribute
            var row = $(this).closest('tr'); // Get the closest table row

            $.ajax({
                url: 'deleteBerita.php',
                type: 'POST',
                data: { id: id },
                success: function (response) {
                    row.remove(); // Remove the row from the table
                    console.log('Data successfully deleted', response);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', xhr.status, xhr.statusText);
                }
            });
        });
    }

    function displayNews(data) {
        var newsHtml = "";
        if (!data.length) {
        newsHtml += "<p>No news items found.</p>";
        } else {
            newsHtml += "<div class='flex flex-wrap justify-between items-center mx-auto max-w-screen-xl py-2'>";
            newsHtml += "<table class='table-auto w-full'>";
            newsHtml += "<thead>";
            newsHtml += "<tr>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>ID</th>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>Judul Berita</th>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>Tanggal Berita</th>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>Isi Berita</th>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>Foto Berita</th>";
            newsHtml += "<th class='px-6 py-3 border border-gray-200'>Action</th>";
            newsHtml += "</tr>";
            newsHtml += "</thead>";
            newsHtml += "<tbody>";
            for (var i = 0; i < data.length; i++) {
                var newsItem = data[i];
                newsHtml += "<tr>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'>" + newsItem.id_berita + "</td>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'>" + newsItem.judul_berita + "</td>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'>" + newsItem.tanggal_berita + "</td>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'>" + newsItem.isi_berita + "</td>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'>" + newsItem.foto_berita + "</td>";
                newsHtml += "<td class='px-6 py-4 border border-gray-200'><button data-id='" + newsItem.id_berita + "' class='delete-news bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded'>Delete</button></td>";
                newsHtml += "</tr>";
            }
            newsHtml += "</tbody>";
            newsHtml += "</table>";
            newsHtml += "</div>";
        }
        $("#news-container").html(newsHtml);
    }
    </script>
</head>
<body>
    <div id="news-container"></div>
</body>
</html>
