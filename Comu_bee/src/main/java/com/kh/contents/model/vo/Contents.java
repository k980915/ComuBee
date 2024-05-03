package com.kh.contents.model.vo;

import java.sql.Date;

public class Contents {
		private int contentsId;
		private String title;
		private String englishTitle;
		private String overView;
		private String posterPath;
		private int runtime;
		private Date releaseDate;
		private String ageLimit;
		private double rate;
		private String actors;
		private String director;
		
		public Contents() {
			super();
		}

		public Contents(int contentsId, String title, String englishTitle, String overView, String posterPath,
				int runtime, Date releaseDate, String ageLimit, double rate, String actors, String director) {
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
		
		
		
		
		

		public Contents(int contentsId, String title, String posterPath, double rate) {
			super();
			this.contentsId=contentsId;
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

		public int getRuntime() {
			return runtime;
		}

		public void setRuntime(int runtime) {
			this.runtime = runtime;
		}

		public Date getReleaseDate() {
			return releaseDate;
		}

		public void setReleaseDate(Date releaseDate) {
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

		@Override
		public String toString() {
			return "Contents [contentsId=" + contentsId + ", title=" + title + ", englishTitle=" + englishTitle
					+ ", overView=" + overView + ", posterPath=" + posterPath + ", runtime=" + runtime
					+ ", releaseDate=" + releaseDate + ", ageLimit=" + ageLimit + ", rate=" + rate + ", actors="
					+ actors + ", director=" + director + "]";
		}
		
		

}
