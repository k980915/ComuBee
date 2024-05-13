package com.kh.contents.model.vo;

public class Contents {
	private int contentsId;
	private String title;
	private String englishTitle;
	private String overView;
	private String posterPath;
	private String runtime;
	private String releaseDate;
	private String ageLimit;
	private double rate;
	private String actors;
	private String director;
	private String link;

	public Contents() {
		super();
	}

	public Contents(int contentsId, String title, String englishTitle, String overView, String posterPath,
			String runtime, String releaseDate, String ageLimit, double rate, String actors, String director) {
		super();
		this.contentsId = contentsId;
		this.title = title;
		this.englishTitle = englishTitle;
		this.overView = overView;
		this.posterPath = posterPath;
		this.runtime = runtime;
		this.releaseDate = releaseDate;
		this.ageLimit = ageLimit;
		this.rate = rate;
		this.actors = actors;
		this.director = director;
	}

	public Contents(String title, String englishTitle, String overView, String runtime, String releaseDate,
			String ageLimit) {
		super();
		this.title = title;
		this.englishTitle = englishTitle;
		this.overView = overView;
		this.runtime = runtime;
		this.releaseDate = releaseDate;
		this.ageLimit = ageLimit;
	}

	public Contents(String title, String englishTitle, String overView, String posterPath, String runtime,
			String releaseDate, String ageLimit, double rate, String actors, String director) {
		super();
		this.title = title;
		this.englishTitle = englishTitle;
		this.overView = overView;
		this.posterPath = posterPath;
		this.runtime = runtime;
		this.releaseDate = releaseDate;
		this.ageLimit = ageLimit;
		this.rate = rate;
		this.actors = actors;
		this.director = director;

	}

	public Contents(int contentsId, String title, String posterPath, double rate) {
		super();
		this.contentsId = contentsId;
		this.title = title;
		this.posterPath = posterPath;
		this.rate = rate;
	}

	public int getContentsId() {
		return contentsId;
	}

	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEnglishTitle() {
		return englishTitle;
	}

	public void setEnglishTitle(String englishTitle) {
		this.englishTitle = englishTitle;
	}

	public String getOverView() {
		return overView;
	}

	public void setOverView(String overView) {
		this.overView = overView;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getAgeLimit() {
		return ageLimit;
	}

	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Contents(int contentsId, String title, String englishTitle, String overView, String posterPath,
			String runtime, String releaseDate, String ageLimit, double rate, String actors, String director,
			String link) {
		super();
		this.contentsId = contentsId;
		this.title = title;
		this.englishTitle = englishTitle;
		this.overView = overView;
		this.posterPath = posterPath;
		this.runtime = runtime;
		this.releaseDate = releaseDate;
		this.ageLimit = ageLimit;
		this.rate = rate;
		this.actors = actors;
		this.director = director;
		this.link = link;
	}

	@Override
	public String toString() {
		return "Contents [contentsId=" + contentsId + ", title=" + title + ", englishTitle=" + englishTitle
				+ ", overView=" + overView + ", posterPath=" + posterPath + ", runtime=" + runtime + ", releaseDate="
				+ releaseDate + ", ageLimit=" + ageLimit + ", rate=" + rate + ", actors=" + actors + ", director="
				+ director + "]";
	}

}
