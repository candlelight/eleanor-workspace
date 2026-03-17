# TikTok Saved Videos Parser
# Extracts travel, food, and things-to-do data from TikTok data export

import json
import zipfile
import re
from datetime import datetime
from typing import List, Dict, Any, Optional
import os

class TikTokDataParser:
    def __init__(self):
        # Keywords for categorization
        self.travel_keywords = [
            'travel', 'trip', 'vacation', 'hotel', 'resort', 'airbnb', 'hostel',
            'flight', 'destination', 'tourism', 'tourist', 'getaway', 'staycation',
            'wanderlust', 'backpacking', 'sightseeing', 'landmark', 'attraction',
            'beach', 'mountain', 'city', 'town', 'village', 'island', 'country',
            'explore', 'adventure', 'journey', 'itinerary', 'guide', 'recommendation',
            'stay', 'lodging', 'accommodation'
        ]
        
        self.food_keywords = [
            'food', 'restaurant', 'cafe', 'dining', 'eat', 'meal', 'dish', 'cuisine',
            'recipe', 'cooking', 'chef', 'menu', 'brunch', 'breakfast', 'lunch', 'dinner',
            'dessert', 'bakery', 'coffee', 'bar', 'pub', 'bistro', 'eatery', 'foodie',
            'tasty', 'delicious', 'yum', 'flavor', 'spicy', 'sweet', 'savory', 'fresh',
            'local', 'street food', 'market', 'farm to table', 'organic', 'vegan', 'vegetarian',
            'pizza', 'burger', 'sushi', 'pasta', 'taco', 'bbq', 'grill'
        ]
        
        self.things_to_do_keywords = [
            'things to do', 'activity', 'experience', 'tour', 'hiking', 'walking tour',
            'museum', 'gallery', 'park', 'garden', 'zoo', 'aquarium', 'amusement park',
            'shopping', 'market', 'festival', 'event', 'concert', 'show', 'performance',
            'sports', 'outdoor', 'indoor', 'nightlife', 'club', 'bar', 'lounge',
            'spa', 'wellness', 'yoga', 'fitness', 'gym', 'pool', 'beach', 'hike',
            'trail', 'bike', 'kayak', 'surf', 'ski', 'snowboard', 'climb', 'visit',
            'must see', 'attraction', 'sight', 'view', 'lookout', 'scenic'
        ]
        
        # Location patterns - common cities, states, countries
        self.known_locations = [
            'USA', 'US', 'United States', 'America', 'UK', 'United Kingdom', 'Britain', 'England', 'Scotland', 'Wales',
            'London', 'Paris', 'Tokyo', 'New York', 'Los Angeles', 'San Francisco', 'Chicago', 'Miami', 'Boston', 
            'Seattle', 'Portland', 'Austin', 'Denver', 'San Diego', 'Las Vegas', 'Nashville', 'New Orleans', 
            'Washington DC', 'Philadelphia', 'Atlanta', 'Dallas', 'Houston', 'Phoenix', 'Detroit', 'Minneapolis',
            'San Jose', 'Oakland', 'Berkeley', 'Palo Alto', 'Silicon Valley', 'Marin', 'Napa', 'Sonoma',
            'Sydney', 'Melbourne', 'Barcelona', 'Madrid', 'Rome', 'Venice', 'Florence', 'Milan', 'Naples',
            'Amsterdam', 'Berlin', 'Munich', 'Hamburg', 'Vienna', 'Prague', 'Budapest', 'Istanbul', 'Dubai',
            'Singapore', 'Bangkok', 'Hong Kong', 'Seoul', 'Beijing', 'Shanghai', 'Kyoto', 'Osaka', 'Bali',
            'Thailand', 'Vietnam', 'Japan', 'Korea', 'Italy', 'France', 'Spain', 'Germany', 'Netherlands', 
            'Switzerland', 'Austria', 'Greece', 'Portugal', 'Iceland', 'Norway', 'Sweden', 'Denmark', 'Finland',
            'Ireland', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'Chile', 'Peru', 'Costa Rica', 'Panama', 
            'Jamaica', 'Hawaii', 'Alaska', 'Puerto Rico', 'Caribbean', 'Mediterranean', 'Europe', 'Asia', 
            'Africa', 'Australia', 'New Zealand', 'India', 'China', 'Taiwan', 'Malaysia', 'Indonesia', 'Philippines'
        ]
        
        # US States
        self.us_states = [
            'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware',
            'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky',
            'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
            'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
            'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
            'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
            'West Virginia', 'Wisconsin', 'Wyoming', 'CA', 'NY', 'TX', 'FL', 'WA', 'OR', 'NV', 'AZ', 'CO', 'UT', 'HI'
        ]
        
        # Price patterns
        self.price_patterns = [
            r'\$\d+(?:\.\d{2})?',  # $10, $10.99
            r'\$\d{1,3}(?:,\d{3})+',  # $1,000, $10,000
            r'\b\d+\s*(?:USD|EUR|GBP|\$|€|£)\b',  # 10 USD, 20 EUR
        ]
    
    def extract_from_zip(self, zip_path: str) -> List[Dict]:
        """Extract bookmarked videos from TikTok ZIP export"""
        bookmarked = []
        
        with zipfile.ZipFile(zip_path, 'r') as z:
            # Look for the main user data JSON file
            for filename in z.namelist():
                if filename.endswith('.json'):
                    try:
                        with z.open(filename) as f:
                            data = json.load(f)
                            
                            # Try different possible structures
                            # Structure 1: Likes and Favorites -> Favorite Videos -> FavoriteVideoList
                            if 'Likes and Favorites' in data:
                                likes_fav = data['Likes and Favorites']
                                if 'Favorite Videos' in likes_fav:
                                    videos = likes_fav['Favorite Videos'].get('FavoriteVideoList', [])
                                    bookmarked.extend(videos)
                                # Also check Like List
                                if 'Like List' in likes_fav:
                                    likes = likes_fav['Like List'].get('ItemFavoriteList', [])
                                    bookmarked.extend(likes)
                            
                            # Structure 2: Activity -> Favorite Videos
                            if 'Activity' in data:
                                activity = data['Activity']
                                if 'Favorite Videos' in activity:
                                    videos = activity['Favorite Videos'].get('FavoriteVideoList', [])
                                    bookmarked.extend(videos)
                            
                            # Structure 3: Video -> Videos -> VideoList
                            if 'Video' in data:
                                videos = data.get('Video', {}).get('Videos', {}).get('VideoList', [])
                                bookmarked.extend(videos)
                                
                    except Exception as e:
                        print(f"Error reading {filename}: {e}")
                        continue
        
        return bookmarked
    
    def categorize_item(self, text: str) -> str:
        """Categorize item based on text"""
        if not text:
            return 'uncategorized'
            
        text_lower = text.lower()
        
        scores = {
            'travel': 0,
            'food': 0,
            'things_to_do': 0
        }
        
        # Score based on keywords
        for keyword in self.travel_keywords:
            if keyword in text_lower:
                scores['travel'] += 1
        
        for keyword in self.food_keywords:
            if keyword in text_lower:
                scores['food'] += 1
        
        for keyword in self.things_to_do_keywords:
            if keyword in text_lower:
                scores['things_to_do'] += 1
        
        # Return category with highest score, or 'uncategorized'
        if max(scores.values()) == 0:
            return 'uncategorized'
        
        return max(scores, key=scores.get)
    
    def extract_location(self, text: str) -> Optional[str]:
        """Try to extract location from text"""
        if not text:
            return None
            
        # Check for known locations
        for location in self.known_locations:
            if re.search(r'\b' + re.escape(location) + r'\b', text, re.IGNORECASE):
                return location
        
        # Check for US states with city pattern (e.g., "San Jose, CA")
        for state in self.us_states:
            pattern = r'([A-Z][a-z]+(?:\s[A-Z][a-z]+)?),?\s+' + re.escape(state) + r'\b'
            match = re.search(pattern, text)
            if match:
                return f"{match.group(1)}, {state}"
        
        # Look for "in/at/near [Location]" patterns
        patterns = [
            r'\bin\s+([A-Z][a-zA-Z]+(?:\s[A-Z][a-zA-Z]+)?)\b',
            r'\bat\s+([A-Z][a-zA-Z]+(?:\s[A-Z][a-zA-Z]+)?)\b',
            r'\bnear\s+([A-Z][a-zA-Z]+(?:\s[A-Z][a-zA-Z]+)?)\b',
        ]
        
        for pattern in patterns:
            match = re.search(pattern, text)
            if match:
                potential = match.group(1)
                # Filter out common false positives
                if potential.lower() not in ['the', 'a', 'an', 'my', 'this', 'that', 'home', 'work']:
                    return potential
        
        return None
    
    def extract_price(self, text: str) -> Optional[str]:
        """Try to extract price information"""
        if not text:
            return None
            
        prices = []
        for pattern in self.price_patterns:
            matches = re.findall(pattern, text)
            prices.extend(matches)
        
        # Also look for price indicators
        price_indicators = ['cheap', 'affordable', 'budget', 'expensive', 'luxury', 'pricey', 'free']
        for indicator in price_indicators:
            if re.search(r'\b' + indicator + r'\b', text, re.IGNORECASE):
                prices.append(indicator)
        
        return ', '.join(prices[:3]) if prices else None  # Limit to first 3
    
    def extract_name(self, text: str) -> Optional[str]:
        """Try to extract business/place name from text"""
        if not text:
            return None
            
        # Check for @mentions which often indicate businesses
        mention_match = re.search(r'@([\w.]+)', text)
        if mention_match:
            return mention_match.group(1)
        
        # Look for quoted names
        quoted = re.search(r'"([^"]+)"', text)
        if quoted:
            return quoted.group(1)
        
        # Look for names before location keywords
        location_pattern = r'([A-Z][\w\s&\'+]+?)(?:\s+(?:in|at|on|near)\s+[A-Z])'
        match = re.search(location_pattern, text)
        if match:
            return match.group(1).strip()
        
        return None
    
    def parse_video(self, video_data: Dict) -> Dict[str, Any]:
        """Parse a single video entry into structured data"""
        # Handle different data structures
        
        # Structure from TikTok export (Likes and Favorites)
        if 'Link' in video_data:
            url = video_data.get('Link', '')
            date = video_data.get('Date', '')
            # For these entries, we only have URL and date
            # We need to extract info from URL or fetch video details
            return {
                'name': 'Unknown',
                'location': 'Unknown',
                'category': 'uncategorized',
                'what_it_is': 'Unknown',
                'price': 'Not mentioned',
                'url': url,
                'description': '',
                'hashtags': '',
                'creator': 'Unknown',
                'date_saved': date
            }
        
        # Structure with more details (if available)
        text = video_data.get('desc', '') or video_data.get('text', '') or video_data.get('description', '')
        hashtags = video_data.get('hashtags', [])
        if isinstance(hashtags, list) and len(hashtags) > 0 and isinstance(hashtags[0], dict):
            hashtags = [h.get('name', '') for h in hashtags]
        
        # Categorize
        category = self.categorize_item(text)
        
        # Extract details
        location = self.extract_location(text)
        price = self.extract_price(text)
        name = self.extract_name(text) or 'Unknown'
        
        # Get URL
        url = video_data.get('webVideoUrl') or video_data.get('shareUrl') or video_data.get('url') or video_data.get('Link', '')
        
        # Get author info
        author = video_data.get('author', {}) or video_data.get('authorMeta', {})
        creator = author.get('nickname') or author.get('uniqueId') or 'Unknown'
        
        # Get date
        date = video_data.get('createTime') or video_data.get('Date') or video_data.get('date', 'Unknown')
        
        return {
            'name': name,
            'location': location or 'Unknown',
            'category': category,
            'what_it_is': self._determine_type(text, category),
            'price': price or 'Not mentioned',
            'url': url,
            'description': text[:500] if text else '',
            'hashtags': ', '.join(hashtags) if hashtags else '',
            'creator': creator,
            'date_saved': date
        }
    
    def _determine_type(self, text: str, category: str) -> str:
        """Determine what type of place/thing this is"""
        if not text:
            return 'Unknown'
            
        text_lower = text.lower()
        
        if category == 'travel':
            if any(word in text_lower for word in ['hotel', 'resort', 'airbnb', 'hostel', 'motel', 'lodging', 'stay']):
                return 'Hotel/Accommodation'
            elif any(word in text_lower for word in ['airport', 'flight', 'airline']):
                return 'Transportation'
            return 'Travel Destination'
        
        elif category == 'food':
            if any(word in text_lower for word in ['restaurant', 'dining', 'eatery']):
                return 'Restaurant'
            elif any(word in text_lower for word in ['cafe', 'coffee']):
                return 'Cafe'
            elif any(word in text_lower for word in ['bar', 'pub', 'lounge']):
                return 'Bar'
            elif any(word in text_lower for word in ['bakery', 'dessert', 'sweet']):
                return 'Bakery/Dessert'
            elif any(word in text_lower for word in ['food truck', 'street food']):
                return 'Street Food'
            elif any(word in text_lower for word in ['market', 'farmers market']):
                return 'Market'
            return 'Food/Drink'
        
        elif category == 'things_to_do':
            if any(word in text_lower for word in ['museum', 'gallery', 'exhibit']):
                return 'Museum/Gallery'
            elif any(word in text_lower for word in ['park', 'garden', 'nature']):
                return 'Park/Nature'
            elif any(word in text_lower for word in ['hike', 'trail', 'trek']):
                return 'Hiking/Trail'
            elif any(word in text_lower for word in ['beach', 'swim', 'surf']):
                return 'Beach/Water Activity'
            elif any(word in text_lower for word in ['tour', 'guide', 'walking tour']):
                return 'Tour'
            elif any(word in text_lower for word in ['shopping', 'shop', 'store', 'mall']):
                return 'Shopping'
            elif any(word in text_lower for word in ['spa', 'wellness', 'massage']):
                return 'Spa/Wellness'
            elif any(word in text_lower for word in ['nightlife', 'club', 'party']):
                return 'Nightlife'
            elif any(word in text_lower for word in ['show', 'concert', 'performance', 'theater']):
                return 'Entertainment'
            return 'Activity/Experience'
        
        return 'Unknown'
    
    def process_zip(self, zip_path: str) -> List[Dict[str, Any]]:
        """Process a TikTok ZIP export and return structured data"""
        videos = self.extract_from_zip(zip_path)
        parsed = [self.parse_video(v) for v in videos]
        return parsed


# Main execution
if __name__ == '__main__':
    parser = TikTokDataParser()
    
    # Example usage:
    # results = parser.process_zip('path/to/tiktok_export.zip')
    # for r in results:
    #     print(r)
    
    print("TikTok Data Parser ready!")
    print("Usage: parser.process_zip('your_file.zip')")
