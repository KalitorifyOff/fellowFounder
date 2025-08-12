const String discoverEventMockedJson = '''
[
  {
    "id": 1,
    "domainName": "Technology",
    "events": [
      {
        "id": 101,
        "name": "AI & Future",
        "profession": "Tech Conference",
        "dateTime": 1765603200,
        "address": "Tech Park, San Francisco",
        "eventDetails": "Join us for an in-depth exploration of artificial intelligence, covering topics from machine learning to deep learning advancements. Industry leaders will present real-world applications that are shaping the future. You'll also experience live demos of cutting-edge AI tools. Networking opportunities will connect you with like-minded innovators.",
        "organizerName": "Alice Johnson",
        "organizedBy": "TechWorld Inc.",
        "organizerImage": "https://randomuser.me/api/portraits/women/1.jpg",
        "isJoined": false,
        "isSaved": true
      },
      {
        "id": 102,
        "name": "Cloud Summit",
        "profession": "Cloud Computing",
        "dateTime": 1768281600,
        "address": "Virtual Event",
        "eventDetails": "Discover the future of cloud technology with experts from top companies. Learn how to optimize performance and security in your cloud infrastructure. The summit will include panel discussions, keynote sessions, and case studies. It’s the perfect opportunity to stay ahead in the cloud computing industry.",
        "organizerName": "David Smith",
        "organizedBy": "CloudTech Group",
        "organizerImage": "https://randomuser.me/api/portraits/men/2.jpg",
        "isJoined": true,
        "isSaved": false
      },
      {
        "id": 103,
        "name": "Cybersecurity 2025",
        "profession": "Cybersecurity Conference",
        "dateTime": 1770960000,
        "address": "New York City Convention Center",
        "eventDetails": "Stay updated on the latest cybersecurity threats and solutions. This event brings together government agencies, private sector leaders, and ethical hackers. Interactive workshops will provide hands-on experience with security tools. Gain the knowledge needed to protect your digital assets effectively.",
        "organizerName": "Sophia Lee",
        "organizedBy": "SecureNow",
        "organizerImage": "https://randomuser.me/api/portraits/women/3.jpg",
        "isJoined": false,
        "isSaved": false
      },
      {
        "id": 104,
        "name": "Future of Robotics",
        "profession": "Robotics Expo",
        "dateTime": 1773552000,
        "address": "Tokyo International Forum",
        "eventDetails": "Explore the cutting-edge world of robotics, from humanoid assistants to autonomous vehicles. Meet engineers, innovators, and startups revolutionizing automation. See live robot demonstrations and attend keynote sessions from industry pioneers. A must-attend for anyone passionate about robotics and automation.",
        "organizerName": "Kenji Tanaka",
        "organizedBy": "RoboTech Japan",
        "organizerImage": "https://randomuser.me/api/portraits/men/4.jpg",
        "isJoined": true,
        "isSaved": true
      }
    ]
  },
  {
    "id": 2,
    "domainName": "Health & Wellness",
    "events": [
      {
        "id": 201,
        "name": "Yoga for Life",
        "profession": "Wellness Workshop",
        "dateTime": 1765603200,
        "address": "Green Valley Retreat Center",
        "eventDetails": "A rejuvenating yoga retreat designed for all skill levels. Experience morning and evening yoga sessions led by certified instructors. Enjoy meditation classes, healthy meals, and nature walks. Learn techniques to manage stress and improve overall well-being in a supportive environment.",
        "organizerName": "Priya Sharma",
        "organizedBy": "Wellness Co.",
        "organizerImage": "https://randomuser.me/api/portraits/women/5.jpg",
        "isJoined": false,
        "isSaved": false
      },
      {
        "id": 202,
        "name": "Healthy Eating Summit",
        "profession": "Nutrition Conference",
        "dateTime": 1768281600,
        "address": "Los Angeles Convention Center",
        "eventDetails": "Learn from top nutritionists and chefs about creating balanced meals for a healthier lifestyle. Attend cooking demonstrations, taste healthy dishes, and get personalized diet advice. Discover the science behind nutrition and its impact on mental and physical health.",
        "organizerName": "Mark Thompson",
        "organizedBy": "NutriLife",
        "organizerImage": "https://randomuser.me/api/portraits/men/6.jpg",
        "isJoined": true,
        "isSaved": false
      },
      {
        "id": 203,
        "name": "Mental Health Awareness",
        "profession": "Awareness Workshop",
        "dateTime": 1770960000,
        "address": "Virtual Webinar",
        "eventDetails": "An interactive online event focused on breaking the stigma around mental health. Hear stories from survivors, experts, and advocates. Participate in Q&A sessions and learn coping mechanisms for stress, anxiety, and depression. Support and resources will be available for attendees.",
        "organizerName": "Linda Martinez",
        "organizedBy": "MindCare",
        "organizerImage": "https://randomuser.me/api/portraits/women/7.jpg",
        "isJoined": false,
        "isSaved": true
      }
    ]
  },
  {
    "id": 3,
    "domainName": "Business & Finance",
    "events": [
      {
        "id": 301,
        "name": "Startup Growth Hack",
        "profession": "Business Seminar",
        "dateTime": 1765603200,
        "address": "Silicon Valley Hub",
        "eventDetails": "A seminar designed for early-stage startup founders looking to scale their business. Topics include funding, marketing, and product development. Learn from successful entrepreneurs and venture capitalists. Networking opportunities with investors and business mentors will be available.",
        "organizerName": "James Carter",
        "organizedBy": "BizGrowth",
        "organizerImage": "https://randomuser.me/api/portraits/men/8.jpg",
        "isJoined": false,
        "isSaved": true
      },
      {
        "id": 302,
        "name": "Finance Mastery 2025",
        "profession": "Finance Workshop",
        "dateTime": 1768281600,
        "address": "London Financial District",
        "eventDetails": "A workshop covering personal finance, investments, and tax strategies for the upcoming year. Gain insights from certified financial planners and market analysts. Learn how to diversify your portfolio and manage risks effectively for long-term success.",
        "organizerName": "Emily White",
        "organizedBy": "FinancePro",
        "organizerImage": "https://randomuser.me/api/portraits/women/9.jpg",
        "isJoined": true,
        "isSaved": false
      }
    ]
  },
  {
    "id": 4,
    "domainName": "Arts & Culture",
    "events": [
      {
        "id": 401,
        "name": "Modern Art Exhibition",
        "profession": "Art Exhibition",
        "dateTime": 1765603200,
        "address": "Paris Art Gallery",
        "eventDetails": "Experience a collection of modern art pieces from renowned and emerging artists. Guided tours will help you understand the inspiration behind each artwork. Interactive installations and live painting sessions will also be featured. Perfect for art lovers of all ages.",
        "organizerName": "Clara Dupont",
        "organizedBy": "ArtWorld",
        "organizerImage": "https://randomuser.me/api/portraits/women/10.jpg",
        "isJoined": false,
        "isSaved": true
      },
      {
        "id": 402,
        "name": "Cultural Dance Fest",
        "profession": "Dance Festival",
        "dateTime": 1768281600,
        "address": "Mumbai Cultural Center",
        "eventDetails": "A celebration of dance forms from around the world, featuring traditional and contemporary performances. Enjoy colorful costumes, vibrant music, and workshops to learn dance steps from experts. An unforgettable cultural experience for the whole family.",
        "organizerName": "Rajesh Mehta",
        "organizedBy": "CultureConnect",
        "organizerImage": "https://randomuser.me/api/portraits/men/11.jpg",
        "isJoined": true,
        "isSaved": false
      }
    ]
  },
  {
    "id": 5,
    "domainName": "Sports & Adventure",
    "events": [
      {
        "id": 501,
        "name": "Mountain Hiking Challenge",
        "profession": "Adventure Event",
        "dateTime": 1765603200,
        "address": "Himalayan Base Camp",
        "eventDetails": "A thrilling hiking expedition for adventure seekers. The journey will cover scenic trails, high-altitude climbs, and breathtaking views. Expert guides will ensure safety and provide training for first-time hikers. Experience the beauty and challenge of the Himalayas.",
        "organizerName": "Anil Kapoor",
        "organizedBy": "AdventurePro",
        "organizerImage": "https://randomuser.me/api/portraits/men/12.jpg",
        "isJoined": false,
        "isSaved": true
      },
      {
        "id": 502,
        "name": "Marathon 2025",
        "profession": "Sports Event",
        "dateTime": 1768281600,
        "address": "New York Central Park",
        "eventDetails": "Join thousands of runners from across the globe for one of the most prestigious marathons. Whether you are a professional or amateur, this event offers a challenging yet rewarding experience. Spectators can enjoy live entertainment along the route.",
        "organizerName": "Sarah Johnson",
        "organizedBy": "RunWorld",
        "organizerImage": "https://randomuser.me/api/portraits/women/13.jpg",
        "isJoined": true,
        "isSaved": false
      }
    ]
  }
]
''';
