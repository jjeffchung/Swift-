//  John Chung
//  MovieListViewController.swift
//  MovieList
/*  Rewrite the MovieList1 app so that it uses a different resource from TheMovieDB API, while keeping a similar
 structure to the current app.
 */
//  Copyright (c) 2017 John Chung. All rights reserved.


import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        
        setUIToDownloading(true)
        self.tabBarController?.title = "Popular"
        
        //let url = TMDBURLs.personIDMovieCredits() //TMDBURLs.popular()
        let url = TMDBURLs.popular()
        print(url)
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            // Simple error handling
            if let error = error {
                print(error)
                return
            }
            
            // Update the view controller's state
            self.movies = self.moviesFromData(data)
            
            // Send the UI Updating work back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.setUIToDownloading(false)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Toggle UI while downloading
    
    func setUIToDownloading(_ isDownloading: Bool) {
        
        if isDownloading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.isHidden = isDownloading
        self.tableView.alpha = isDownloading ? 0.2 : 1.0
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    var cellNumber = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        // Get the movie associated with this row out of the array
        var movie = movies[indexPath.row]
        
        // Set the movie title
        cell.textLabel!.text = movie.title
        
        // Set the movie poster
        
        if movie.posterPath == nil {
            // api node has no imagepath
            cell.imageView!.image = UIImage(named: "noImage")
        } else {
            // Set a placeholder before we start the download
            cell.imageView!.image = UIImage(named: "placeHolder")
        
            // get url, 
            let url = TMDBURLs.URLForPosterWithPath(movie.posterPath!)
            print(url)

            // create task
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in

                if let error = error {
                    print(error)
                }

                if let data = data, let image = UIImage(data: data) {
                    movie.posterImage = image
                    DispatchQueue.main.async {
                        cell.imageView!.image = image
                    }
                }
            }) 
            
            // resume task
            task.resume()
            
        }
        
        return cell
    }
    
    
    // MARK: - Parser
    
    func moviesFromData(_ data: Data?) -> [Movie] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
        
        // Insist that this object must be a dictionary
        guard let JSONDictionary = JSONObject as? [String : AnyObject] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Movie]()
        }
        
        // Print the object, for now, so we can take a look
        print(JSONDictionary)
        
        // Pretty Print the string, for debugging
        let prettyData = try! JSONSerialization.data(withJSONObject: JSONObject, options: .prettyPrinted)
        let prettyString = String(data: prettyData, encoding: String.Encoding.utf8)
        print(prettyString ?? "No String Available")
        
        let movieDictionaries = JSONDictionary[TMDB.Keys.Results] as! [[String : AnyObject]]
        //let movieDictionaries = JSONDictionary[TMDB.Keys.Cast] as! [[String : AnyObject]]
        
        let movies = movieDictionaries.map() {
            Movie(dictionary: $0)!
        }
        
        return movies
    }
}
