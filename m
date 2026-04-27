Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E304FF8862
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Apr 2026 12:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99B110E2A1;
	Mon, 27 Apr 2026 12:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ylc3vi+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4D10E2A1
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294484; x=1808830484;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wG4DNKrj6KFDz325PYrbXDQniE8SZDpw24Dh4U/IMNc=;
 b=Ylc3vi+5I7wu/rmXiHhYujP7SLXSQ0dhCcnnYxuQ65/ZkNgSGRBKfxn0
 az65PcIpkLSrlvglIqdhJK9DV/lQKhq353+i8pAdeQjEGIeJ2Zz0PZsxZ
 /VuuBQSwFQ4y0XDRbLz0/SwlwaGrNjVXAqzJlFzOOR2eO+uTICnLG0C/h
 jrveq+hSo8LEq5C24xU0kAE7Dr8g5yyttlhpbq3qhaMuE5i4lSTq9j44z
 1nnMFf/wvS2uxzW6eKZc+IhjMqRuwyfwZtsNcPW+coLjXMZR3nEcbB/uR
 U5QK5KPamJRXTasiva4qeFMCKvszOhI30ysgjYThLCWbp4PZ+zegm3Ko7 A==;
X-CSE-ConnectionGUID: bOyVlk5lR2mA42+saPkK+A==
X-CSE-MsgGUID: MrDay/YcTa+BdbFa37UsVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="82029849"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="82029849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:54:43 -0700
X-CSE-ConnectionGUID: c1nTtpehRf2mlwKRTnpsWQ==
X-CSE-MsgGUID: Q9536OmATGumobfYxox32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="238615402"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.53])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:54:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, intel-gfx@lists.freedesktop.org
Cc: andi.shyti@linux.intel.com, krzysztof.karas@intel.com
Subject: Re: [PATCH] drm/i915: replace fetch_and_zero() with kernel xchg()
In-Reply-To: <DI3Y8OJDXY88.2QYSAA88WIVH9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <75ba7e77fe28617f027ae49a620df8b580cd1000.1777291964.git.sebastian.brzezinka@intel.com>
 <7d18b591154516efd9be14c643bd576678b616bc@intel.com>
 <DI3XYF0I8YPD.336A8XEBGNCDT@intel.com>
 <b7e7bf8c2f0946763f992dc06342e0bfaba98c90@intel.com>
 <DI3Y8OJDXY88.2QYSAA88WIVH9@intel.com>
Date: Mon, 27 Apr 2026 15:54:39 +0300
Message-ID: <6e565866808e0f2661f4858fbdccfe4080196323@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 27 Apr 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
> My bad, sorry for that.

Hey, no apologies needed. I'm sure this is not properly documented
anywhere, and even if it were, there'd be so much documentation nobody
would read it anyway. ;)

BR,
Jani.


-- 
Jani Nikula, Intel
