Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24470C61DA4
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Feb 2023 10:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BCF10E868;
	Tue, 14 Feb 2023 10:39:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B461610E868
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Feb 2023 10:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676371180; x=1707907180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=38nqwfw16oZOGlEfjMQwKjzNFoBqU0pLkU/M2FZP1co=;
 b=ciYDb5hiwhpI7JAE4f2/snKIU8BwarxTcoKC1EXR1eFm7bU9krlm1TYW
 pudQPEA+PpOps/CgWquVPEjjI2Sg+WODVQqSMXI+9PFVcBAtEKnukewdg
 RHf3qV92IxVoG4Xitl6BSVAJ6Vspnpx/TZPMWFdxnMKpUWuE5WqiuXLwM
 ULOzON9F2F80PzUtN2gSVKnNIbzjfaa6pqFAuOUe/r4SzG4UYV4kSam9f
 EfYL7nUPStPNWqXrFRfF0l0bue/ZoKn7PN1dBD0qvb2Hjqfb52oXiPtJ7
 y8tE2NMegP4D/EXPkDXzUgA9SJCZ8/wsvQQtNdL5LWuA8dz/22fGn7aj4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329756416"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="329756416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:39:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="998028637"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="998028637"
Received: from nkomlevx-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.251.214.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:39:38 -0800
Date: Tue, 14 Feb 2023 11:39:35 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+tk5zUKbOCVHHGV@ashyti-mobl2.lan>
References: <20230210150344.1066991-1-andi.shyti@linux.intel.com>
 <17d5dc0d-4bb9-6e13-bac1-8d1e7aad3f17@linux.intel.com>
 <20230213233654.t6icjq5e2bhxn44k@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213233654.t6icjq5e2bhxn44k@ldmartin-desk2.lan>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Use i915 instead of dev_priv
 as name for the private device
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 13, 2023 at 03:36:54PM -0800, Lucas De Marchi wrote:
> On Mon, Feb 13, 2023 at 02:11:26PM +0100, Das, Nirmoy wrote:
> > 
> > On 2/10/2023 4:03 PM, Andi Shyti wrote:
> > > It is becoming a strong habit to call the drm_i915_private
> > > structures "i915", but there are still many left that are called
> > > dev_priv.
> > > 
> > > Sometimes this makes grepping a bit challenging and anyway it
> > > keeps a coherent style.
> > > 
> > > Rename all the "dev_priv" structures in the gt/* directory to
> > > "i915".
> > > 
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > > Hi,
> > > 
> > > just checking if we want something similar. I have this same
> > > replicated patch for the rest of i915 but I want to make sure we
> > > actually want it.

Thanks Nirmoy for the review!

> > I might be lacking historical context here but I assumption is we are
> > moving towards replacing dev_priv with i915 everywhere.
> 
> Context: 20230201135329.514677-1-luciano.coelho@intel.com and 87bkml5wv4.fsf@intel.com

I think I have everything fixed, just didn't have time to format
patches correctly. So that I decided to take this baby step
to test the ground first and then move forward in the next couple
of weeks.

I don't think this patch that affects only the content of "gt/"
has any dependency on dev_priv macros so that please let me know
if anyone has anything against.

Thanks,
Andi
