Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9666EC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Jan 2022 00:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF82211289B;
	Tue, 18 Jan 2022 00:55:04 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B0611289A
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Jan 2022 00:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642467303; x=1674003303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HbICG2+jhJP/czq2HI1gEvCOnvtCpKV798JGkjPb7E4=;
 b=ElKs5bbVtdN9UZYONm/oK98D6VfAaR9DFGH/RaWW7n9ROy+Llxlqa4VX
 DvhfmmgiPzhdEm2RwG72bZH6ZgAVxFurwM4FXI4E6jKCSXM1rKflKeAiR
 O3rI4Po3MUWJ5oEZFsxSrvdQkEngytp6EVw7WpkwrpqxlepazqtwXWXg9
 G6bcYz8A94yzXsz80+h/gUqtVN7km/NN/TkZj4OO1RjspOZq7o5CiyYym
 hbqplazRgdEwVOHjQy8JFU+Wz/aVOXQCCNRoACkjiCS9qm4VfD9tPFSHL
 d/ErJ8nNh1fWbm6U61UoczXJ9h0/Z/XrojLhWKjU/MyGYlDmZHxUZaXMS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331062063"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="331062063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 16:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="671686729"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga001.fm.intel.com with SMTP; 17 Jan 2022 16:55:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Jan 2022 02:55:00 +0200
Date: Tue, 18 Jan 2022 02:55:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <YeYP5AakqGlkVXsE@intel.com>
References: <20211201152552.7821-1-ville.syrjala@linux.intel.com>
 <20211201152552.7821-8-ville.syrjala@linux.intel.com>
 <500a2ae59268fe4579ffcf1164589bf77791a2ad.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <500a2ae59268fe4579ffcf1164589bf77791a2ad.camel@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 07/14] drm/i915: Clean up pre-skl primary
 plane registers
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 08:12:31PM +0000, Souza, Jose wrote:
> On Wed, 2021-12-01 at 17:25 +0200, Ville Syrjala wrote:
> > @@ -427,9 +427,9 @@ static void i9xx_plane_update_noarm(struct intel_plane *plane,
> >  		 * program whatever is there.
> >  		 */
> >  		intel_de_write_fw(dev_priv, DSPPOS(i9xx_plane),
> > -				  (crtc_y << 16) | crtc_x);
> > +				  DSP_POS_Y(crtc_y) | DSP_POS_X(crtc_x));
> >  		intel_de_write_fw(dev_priv, DSPSIZE(i9xx_plane),
> > -				  ((crtc_h - 1) << 16) | (crtc_w - 1));
> > +				  DSP_HEIGHT(crtc_h - 1) | DSP_POS_X(crtc_w - 1));
> 
> DSP_HEIGHT(crtc_h - 1) | DSP_WIDTH(crtc_w - 1));

Whoops. Thanks for cathcing that.

<snip>
> > +#define   DSP_ENABLE			REG_BIT(31)
> 
> I really don't like DSP, it is broadly used acronym to Digital Signal Processors.
> Would prefer to have DISPLAY or DISP.

The registers are called DSP<foo>, so the spec makes the case for DSP_.
The problem with DISP_/etc. is that the namespace then makes it a bit
hard to figure out what register the defines belong to.

> 
> Anyways, DSP_ENABLE should have also have plane on it.

DSP==display plane. Any more would be redundant.

> 
> Other than above and a minor typo reported in general looks good to me but it also broke build because it missed GVT renames.

Always happens to me :/

-- 
Ville Syrjälä
Intel
