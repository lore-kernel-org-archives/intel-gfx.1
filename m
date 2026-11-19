Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D9606E8AC
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BAu9p1gD;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WRCRKIGd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BA51124DE;
	Thu, 19 Nov 2026 14:48:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2751124DE
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795099722; x=1826635722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nrQo9zL98LA0qJSTe3U6gV83M4dnL7Wng2h8W79UfFA=;
 b=BAu9p1gDrzYSRNtBeJcbGYu9JML4bgzqbO4zUBKwMm6h0RNhHcquOEv+
 fv0F3PjOyMMgKlicT8lXpY/tot95Eu1cFUNE+kqLzZNR1pr52ySpLkWHO
 U4Zm3d+K8QEdUIO7jzFJPnCzehTIHR5z7l2zBEOhAWt8wF1/TI6XM7/1H
 5/dutxVjFwWitGtAUxg9uUGwgw9yj9P1EfsvKVYVLV+nfV1b6nGSlluhc
 c9We5ek7HMw0UhYV+RdHWDVrYkUWd3GpmdFvX/hVwHknPDTYauWOZ6n29
 lTbWCztL95xLGMvnX23nVMi4AIDq+yHuWu4k1thyUkbFTLmNbvG5CUyqB Q==;
X-CSE-ConnectionGUID: VD0BmXlATcKhEcYNH+s1XQ==
X-CSE-MsgGUID: f/ElDI7pRJ2FbF2a6vc+fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3943253"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3943253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:48:42 -0800
X-CSE-ConnectionGUID: 6vzp2BiZTJWEebOrJRbUcw==
X-CSE-MsgGUID: bwJSupv3QLecrXqer2hUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10818842"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:48:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:48:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:48:41 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhmHPg2eWjb302gMwxeY+Y/Y7kxeFP96VAlYHOoTakTw9vj2uCZgdprIiWJ7zM89bAGwydrvCSxNxhxI3qJMxmTODBz+QXTZOlhekIInUwPEFtqd7uG0lKFr7osp0qGq6UfdW4YGaMoFiFRbMStgCKtsivWn4DW82kGtd55XwjJ83p/ESHAhRaeExCk7soMg5LOX84M8ib56Fv2zaDKDRf/y5k0xGju1bSfd518L+5sWnLgCzQvJi6jfZnWs8DYZzaB9KmbsyLVWPaagk/FL5w9Uq+l0S5gnZ+fvlzaH4/DlimXuPyHH7okgSAumYIJvenybt1dzKq0GMN+SUo8kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8viR6W9OTj3mYCDdiXIg5kqlaV/3hnqToV6XXpNkWg=;
 b=IabpEv/kPN+Kt/CyUyi7fcIepW8JaMSjJFtzeE0G0wkYDG9z13EdD8cqyaYdfvlvAQPvFtvkbwrSymYr7d5KhZeu2OODSJfdY9G3Pi//+ZOhx6767EXFmCBNu0R3XuT+X5/rTk9Be/8L+9vwWEDUjLgSLlbQmTkzNI1iab64hBks+jD0eJTU7hYXImzYk3/hlZG8k8fpBUOHFKd1AJGAKlidpRWKQXGWPfn6S3Owry4msTXJ77PnJojOQJAec8VX+mxyj5guubdrg1K4ivSthaTSCVBDqhJgP4AeSBGohWuSDtDyGsrMYpclh0QJQiAfPMs7eZakPxxPREDQyQ4GWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8viR6W9OTj3mYCDdiXIg5kqlaV/3hnqToV6XXpNkWg=;
 b=WRCRKIGdwjBaU4WtACUBJ6/AcjfaDdzVTB+dmf7o7wvmji7uDtp+XtfT4sasyzw7u+WxAopbOXF5SrVFDjTwMsUMc2om9m7mDQtI++7SGcPckUbvBa7d6CMQJQlEc14CyqAyJ4AseeMpr9HGrawofHnoDlmEdd9v7NK6r9aDcYE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by DS7PR11MB9450.namprd11.prod.outlook.com
 (2603:10b6:8:26b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 14:48:39 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:48:39 +0000
Date: Thu, 19 Nov 2026 14:48:29 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
Message-ID: <fghd7te6mqzzafb2kph3jjmxrtdmetswwjppsqahjvwnxgqchz@hn7la5kbqzhw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
 <dveqarxlsulf7nwrfjgolsp5ntcqlhkbziwsyth5pdzqeiqlrc@znzrnadm3rie>
 <DMZ4ACDNRWED.LAR9KL21OIDK@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DMZ4ACDNRWED.LAR9KL21OIDK@intel.com>
X-ClientProxiedBy: DUZPR01CA0195.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::26) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|DS7PR11MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: e06001b8-a3bd-411f-8f6d-08df464c327d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022075727099003|261022115727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OLlnrkJqs14GADXNKPu6Cz5hEBxluR1bGw7wZYdK9ATQxg+WOsK8uWjSgOhElsikzTqkJobY8Vj4Wn5iero1luzHAuDZNQh+YBaz2wX3agkFl+OohO8sgiBX4PNH4hhgKAE4wSe7thxMzgnlhvBJMR387pwleSdBCp3Dfk19Wk1z6NkHVynS43FztKxUaViX78ANlGPS3ig4QZPDk4yKNx4Hn+efuk056ghf1NfrEdnmiBsf847/vrCqcKYQlr6opyWoXM3kxMyoyS9iKtkC9hKBS9frJzbQ5vh2JWXdEK1MXxHZRLtkYITXrvzNRoUwGCxMK1ztR3oT0lyKGZ+AeWV0av3mfK1UVzcZotzlFr4yvWFc9Fhz1OXWFZ5CjPhhQHtVHiPDa2a/kJtUz3sY/dRlTHcA6ZRDToPyLdnmyWH5XGxSvRPXx5z4IJQ9efgXwUBd5+QkUAFA3yQvWnuTFs1yollAh09rTgspXV3EA5lhhnUxLQ4cbvm3q8tputmM5AGellA0fmUcasMuYbKObjvZnlovVWU0mJKgXepgLHbxIp1JL0s0RVA8uJeZSMX0C0wG2MP5MCgKk/0eWk7kw4He4dc2Tt95XqrlMNSYR7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022115727099003)(261026121527099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBiNGQ1ZUtDbG1xWnA5T0FDT2phV2czMVdMWXhQMThpaDI5Nm04N0k2UHJq?=
 =?utf-8?B?WnliaDJIa0RQL3lPb21YaGM0UTJISjdHM3dqOTJOUWJlVXg2ekpETWpkTGcy?=
 =?utf-8?B?OFk0OVN3dE9oS094OURDRlhXUTkxMTloRFE0TWZWZ3VJZ2RzQjZxRWZPTE9w?=
 =?utf-8?B?a1Qwc1FBUjFWemgyUEg4TzdTK3krcy9tK0k3UWpMZzY2WERUVVZlS2xEYnZN?=
 =?utf-8?B?cjhIMGlxdGdIb3V0U0tmRlVGVFBrWHZ5SHN6NGJuaFJaeXBnRk93dVUwVHNm?=
 =?utf-8?B?ZlhjVHBmcW0zbEpGUWU0ZUc0NTErb2RmOUltTjdQUjVDUHNwNkhaTXIxUEQ4?=
 =?utf-8?B?ZW0yZlp6dGZ0cVZTalpzODRmdXI5aVBYcG9EUE9uSkY2d1JZeUczWWR6V0N6?=
 =?utf-8?B?SGFGSzJCdE5QVXEzTGZCUmZxRmhaVnFzMzBybFFxOTVBMjFXSVc5ZjJ4dWNY?=
 =?utf-8?B?QmRYZTNZUlVVdVBaR0owM0J6OWtUeUVaSlkrNWNvRHhGd3c1ZXZ5OHRvMytO?=
 =?utf-8?B?NjcwMmFOdWY5S3JFdkNBbVg3LzVMTG9uT3ZVVGlDVFFHSzFsVVBvdTU2TGhV?=
 =?utf-8?B?RFJUUWgrNzU1eWZidkZHcDJPSldZY0dTZE4vL08xOTYrcENMampDOWNYVGpW?=
 =?utf-8?B?MUtmLy9pcEhWS3EvNnpybVZKVUFlWkdvS0duWUxOc2l3eFFQbWRWMjhRYXdn?=
 =?utf-8?B?OXFOTGM2RXdyVjBRWlJaV1h4QmR6WXdpY1NjUkcxV2RxRy9nUHJSNW8vaG5F?=
 =?utf-8?B?SjZUWW04ZEhoZHBMY3Bvd1Z5N3dYWEd5OUdqaklnNmx4UXNrMS9SV09CaHBN?=
 =?utf-8?B?MFlUcnNobWd6Smc0SER3amthR3pKYnc2ZDA0eFQ0SWlTVkxqWFVnTTNXK3lh?=
 =?utf-8?B?RmUyUndPa1A1ZWV5QmtQbW85dVRtSnpUTVVCbWpxcVZBM25nU1pMN2orbnQ5?=
 =?utf-8?B?SmQ2S2dUU0R6cTY1MWhveDZVSnYvcmpUOWo3cWhhMWI0dnAxNkZINXlGVlFw?=
 =?utf-8?B?WkhDZTh5SGxWV3VOTUdnVkFuTjk2alVxSmJHd3U2bGp6b0JqSmcxR1luRk5V?=
 =?utf-8?B?QzhjN3hCRUM0Nzl4Z1dZS2dUK3lUdXVTYnNLajZ1OGp0NEJZQ1hmVFk5NnRX?=
 =?utf-8?B?QS9RelZlVEh2RkFzQis2OTlpb1hVQmlBRmlQbjJnU2FZQmxvZHExYU1Sb1dp?=
 =?utf-8?B?anRrSE1LcktXVC9Idlg2d1grRlFzamtBWnhsdU1nVnFzVVJHT0lScjhuSm5X?=
 =?utf-8?B?QzRYSTRHN3JXMG8wUGZTbTBrNWsvL1RxNENDZXlTOHlXbHc0WTlXTFpoeS85?=
 =?utf-8?B?ZGNxVUVKaU9Qa2dWSmZ1UlJUZ1RhMmdNbm94RWIxRC9aUURpSXhNZlpHOGJS?=
 =?utf-8?B?RWkrVDY4UW5qZ0JmaUxKMGNFWk1RRlpjZ05wSGVZWDF3SDJsTDBqR2N0UHMy?=
 =?utf-8?B?TUF5a2dmcDNmSHlxdHd5eERWNVBnbHBLUGNhdlV1ZllvemtTRElnazZLNE5x?=
 =?utf-8?B?cmtUUHRBbTYyK0ZiOFFkS0UwWWR6NGtERGZmZThwMjlmcDRwT05xR21lQWNE?=
 =?utf-8?B?eHoxTlBZWndPVnlmWVJrL243ZlpWWDlNYlozbEZkK2cvNDBOVWpraG5nK1FH?=
 =?utf-8?B?b3hYcHFJQ2NkMENYZHA0VDRmdjFieHlBK2NXQlhJZjRLTGorQ21uUWdXa01q?=
 =?utf-8?B?TUo0Um5QNlRiaDNPZ3RuaXdXZisrK2ErRVdjZzFPTWRpK01HVnJPVU5lbmtz?=
 =?utf-8?B?bGFxN1BxdTc4dXdGZkhzUm5rRHN0eVVycWl2b1VEVXBmYnoxUW56SnFOdnhZ?=
 =?utf-8?B?a2U3SkxUTGNjQnFnVnc4SEZPR2ZkUG1GQ0hwQlJRZDhyTmk1RzY4U3cyZEY2?=
 =?utf-8?B?UU4rNzhWMnhZREVWSDB1RVdnVitUSXJ4OWhvbGxlbGk5UGJJelhGZ3BtTkxw?=
 =?utf-8?B?bmVmOUlPNXU1WlpxUVBIVzk1SGoxemJrelJFdG5Vb1h2TytJNEpTQmpNbFFJ?=
 =?utf-8?B?Y1N5TzdCSHZJNlZrR1lWMEtXSG1DWkdHRDlYTG9WejNieTY5TWFtUmxnOWt5?=
 =?utf-8?B?RE03VkVnYitjMjQ1dnl4Y0NaV0Y0NldWZFJsbitsKzZFMW03TzFhT0FreVRu?=
 =?utf-8?B?anRzd2xNb2dNSUNUcUJ0ZHNsOE9CKzNWWHA1S0NDOUVUVWpDVEJuUGlsSjJC?=
 =?utf-8?B?ekdZWEJ3Kzdad2VETER1djVyMHZZMk9GZThxS0I1NElsKzkyc2tlOW02UGFm?=
 =?utf-8?B?dHd3QXZUclZ3TlVDR0pTSXBUdXdVMHk5cVU5U3FDTDR2M0RLb1hnOVAyMmVX?=
 =?utf-8?B?MUtGUlV0TGxacUE1N2EyQVRKWGlPNWtJM0hZMDB5NVp4S2dxOTdYVGVlYmx6?=
 =?utf-8?Q?heIEIUnwxqSmKrIY=3D?=
X-Exchange-RoutingPolicyChecked: tEee1DDKBuhPASxmI5+Zy3ZfL5R0b4AveR9f1btH9mZbYJruXdFEYYGM+CH6mIp5bf3xCt6CxLRqTuLqkInLjVwy8h14ovujabout1FFCDgBWXXh3XLXVHr6avBnKA9tq++RCa26gnjyfJuSrxc2z9XqyX2S+nZGUK9JS6iRHaV6LaNWzbcDEvRVpoABxtY9dmyM+nNCGh8y7HDlMpaess6PwMHKno1uYXM8yfyKM/46aFvOCFByAWWjKXMR3DoGgFNrC+/dcv2gd+IkXQsHSKE0z7zLCexqxIsU58Lu/Za9Zy2vf2WJE2wkX3yzX+M+Bsr9NF5KWD61U+NSDb0gYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e06001b8-a3bd-411f-8f6d-08df464c327d
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:48:38.9187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdQxepO4NkfQk+4mCTbczuNpRdNu3dVxeIKetONUEHh+Q0EE75Cl2esgUag55EU7VHCELGqTfOS3sxPbVNPsr1Rfqi+nyu+JBKp5ejB1s/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-11-19 at 11:32:09 +0100, Sebastian Brzezinka wrote:
> Hi,
> 
> On Wed Nov 18, 2026 at 4:23 PM CET, Krzysztof Karas wrote:
> > Hi Sebastian,
> >
> > On 2026-11-18 at 14:02:18 +0100, Sebastian Brzezinka wrote:
> >> _igt_reset_stolen() use via __drm_mm_interval_first(), but
> >> does so without holding i915->mm.stolen_lock. Every writer of this
> >> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
> >> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
> >> reader can race.
> >> 
> >> This was observed as a NULL pointer dereference in
> >> __drm_mm_interval_first() during igt_reset_device_stolen():
> >> 
> >> BUG: kernel NULL pointer dereference, address: 0000000000000010
> >> ...
> >> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
> >> ...
> >> Call Trace:
> >>   __igt_reset_stolen+0x565/0x6a0 [i915]
> >>   igt_reset_device_stolen+0x1a/0x30 [i915]
> >>   __i915_subtests+0xb8/0x250 [i915]
> >> ...
> >> 
> >> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
> >> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
> >> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> >> ---
> >> v1 -> v2:
> >> - Fix always false !__drm_mm_interval_first() check (Andi)
> >> - Extend stolen_lock over the poison/verify writes, not just
> >>   the lookup (Andi)
> >> - Move the lookup into stolen_page_unused() helper
> >> 
> >> v2 -> v3:
> >> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
> >>   hardware reserved stolen pages (Shashiko)
> >> 
> >> v3 -> v4:
> >> - Only verify pages poisoned before the reset; pages in use (e.g.
> >>   rings) may be rewritten and freed during reset (CI)
> > You forgot about the changelog for this version :)
> This series started as a single patch. When I split it into a series,
> I moved the changelog to the cover letter.
Very well then, no further remarks :)

> 
> >
> > Not critical, so:
> > Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> >
> >> ---
> >>  drivers/gpu/drm/i915/gt/selftest_reset.c | 23 ++++++++++++++++-------
> >>  1 file changed, 16 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> index 2cfc23c58e90..7d4b0382fe19 100644
> >> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> @@ -14,6 +14,16 @@
> >>  #include "selftests/igt_atomic.h"
> >>  #include "selftests/igt_spinner.h"
> >>  
> >> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
> >> +{
> >> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
> >> +
> >> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
> >> +					page << PAGE_SHIFT,
> >> +					((page + 1) << PAGE_SHIFT) - 1) ==
> >> +	       &gt->i915->mm.stolen.head_node;
> >> +}
> >> +
> >>  static int
> >>  __igt_reset_stolen(struct intel_gt *gt,
> >>  		   intel_engine_mask_t mask,
> >> @@ -79,6 +89,8 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  		i915_request_add(rq);
> >>  	}
> >>  
> >> +	mutex_lock(&gt->i915->mm.stolen_lock);
> >> +
> >>  	for (page = 0; page < num_pages; page++) {
> >>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
> >>  		void __iomem *s;
> >> @@ -95,9 +107,7 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  				      ggtt->error_capture.start,
> >>  				      PAGE_SIZE);
> >>  
> >> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> >> -					     page << PAGE_SHIFT,
> >> -					     ((page + 1) << PAGE_SHIFT) - 1))
> >> +		if (stolen_page_unused(gt, page))
> >>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> >>  
> >>  		in = (void __force *)s;
> >> @@ -143,10 +153,7 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  			in = tmp;
> >>  		x = crc32_le(0, in, PAGE_SIZE);
> >>  
> >> -		if (x != crc[page] &&
> >> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> >> -					     page << PAGE_SHIFT,
> >> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> >> +		if (x != crc[page] && stolen_page_unused(gt, page)) {
> >>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
> >>  				 &page);
> >>  			if (count++ == 0)
> >> @@ -159,6 +166,8 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  	mb();
> >>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
> >>  
> >> +	mutex_unlock(&gt->i915->mm.stolen_lock);
> >> +
> >>  	if (count > 0) {
> >>  		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page %ld\n",
> >>  			msg, count, max);
> >> -- 
> >> 2.56.1
> >> 
> 
> 
> 
> 
> 
> -- 
> Best regards,
> Sebastian
> 

-- 
Best Regards,
Krzysztof
