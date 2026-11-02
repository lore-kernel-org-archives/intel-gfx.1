Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4C606A326
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLtIXdGv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0935810E71D;
	Mon,  2 Nov 2026 23:13:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D15210E71D
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2026 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793661178; x=1825197178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tmgZlEQkJKG+ukDEQLPZ6kSe/no6NBjxFrCHtrUOmQA=;
 b=iLtIXdGvwOXTHzyFwz1eYz00lPoNN8ivwNEvLkRIkzjU9rbw1iuN1e1v
 ph4fAA8Om9TdtO/2mkSPU4VRKoI2V9cmGP33NEpPMtkaLrAmfoaOcl8zE
 RUTFYsDYJlXtMfHQE2wO3Du4xuJ7FMfwgEQexUnY1tGwrHgEvEiBIOnfa
 Y1cCMWqgz6PWRbyuCr77RI5l+sSHSZeZydbuvYW4MXuM70eauFuy1TsqO
 9wNnJ8/GB32jHsJ4dUjgAEX9mc7oFqAx/Jj8wPcKgG5Sv4U8puwQYaP2i
 5DO53Y67vTavAPLvGJeOLMbHkwqogctb+bCbss/gdC8NVgEBF4fAl3bf9 A==;
X-CSE-ConnectionGUID: 2PZM/hZgT2SCqN49T280lw==
X-CSE-MsgGUID: BFrFNrl+Qt6mcDh9NqQS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2251638"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2251638"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:12:57 -0800
X-CSE-ConnectionGUID: qivCNTNFSS2EvFdaWaRerA==
X-CSE-MsgGUID: G1xncTiuQ7ub1fSLb1g7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="8086030"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:12:56 -0800
Date: Tue, 3 Nov 2026 01:12:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon.Richter@hogyros.de
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: Component swizzling during output, and synchronous output
Message-ID: <aukY9mvihRTO8vX2@intel.com>
References: <da96dc26-f7f5-47b1-984a-569c1866ce1d@hogyros.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da96dc26-f7f5-47b1-984a-569c1866ce1d@hogyros.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:53:59AM +0900, Simon.Richter@hogyros.de wrote:
> Hi,
> 
> I have a video mixing desk which can accept a second input as a key 
> source, translating luminance to opacity.
> 
> The obvious way to generate this is to build a compositor that provides 
> an RGBA render target to applications, and then copies that to two output 
> framebuffers.
> 
> Can I somehow skip that extra step and configure the RAMDACs to read the 
> RGBA framebuffer directly (sending .rgb to one output, and .aaa to the 
> other)?

Reading from the same piece of memory on each output is easy.
Just point the planes on each at the same memory.

The swizzle is harder. Apart from blending the display hardware
just ignores the alpha channel. So you can't get at it so easily.
The obvious solution would be to treat the same ARGB fb as
RGBA for the other plane and then get the alpha channel out
as the red channel. Unfortunately I don't think our hardware
supports any swizzle with alpha at the bottom, it's always
at the top.

I guess one crazy idea would be to interpret the ARGB8888 data
as ARGB2101010 on the other plane. That way you could get the
six lsbs of the 8bit alpha into the red channel msbs. The top two
alpha bits would be out of reach, so whatever is producing the
data would have to deal with that. Then you use the pipe CSC to
replicate the red channel into blue/green. At that point you 
still have the problem of the four lsbs of each channel now
containing garbage from the actual 8bit red channel. But those
could be eradicated using the gamma LUT.

> 
> Also, is there a way to synchronise two outputs that have the same 
> resolution, so that the delay inside the mixing desk is the same?

On some platforms we have a hardware mechanism called port sync
for that. But it only works on DP outputs. And for now we've
only implemented it for SST. MST is theoretically possible but
no one has attempted to reshuffle the modeset code to get it
working.

Port sync is being replaced with something else in the new
hardware, which I think should work on HDMI as well. But I'm
not sure anyone has actually taken a look at what it would
take.

That said, I think getting the outputs almost into sync should
be possible without the hardware support as well. Would need to
figure out exactly when the timing generators start (which
incidentally I've just done) and then try to start them all
in one rapid burst. So (like the MST port sync case) it should
be a "small" matter of reshuffling the modeset sequence into
shape.

-- 
Ville Syrjälä
Intel
