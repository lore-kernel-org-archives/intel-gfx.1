Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E09CC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Jun 2022 16:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D084510E0ED;
	Mon, 20 Jun 2022 16:10:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B80E10E0ED;
 Mon, 20 Jun 2022 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655741435; x=1687277435;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lMY8SyLOqFuZTxqRL2A+doM4TfrT3YYNg0DNWR0ELgY=;
 b=Ulc9Z5B2v9VO7WPV+OV8/fFKxvvMkjdLmwp4p7TxgUe9MzeSNXhmvVCc
 RlnUaRLe49Dw3XP6QREFzvrTaDe8DadfG/+4A7eJzyll/0y3hXN1rozgB
 y0jgmH7oWvqCbYxoGbbSshIcXa/DU5hyovnIGBDfM5utdGNpCxStW/tmT
 WtBG05bQcMdrOvokZ2zvNJLu7wcYTpJ1f3akTsZFIoCPPW28zUjV33uSs
 Rk6P6e8ZGJXXmi4lCmijze/Bn6XbAxxSRyaT0sYHtcCzDljJfGDTrkTvY
 NCe9K6m2K+KbmqW1ax2OkmVLc6mEzyPLGPmIDTpezUjvmNH44MSjSMyvp w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280661967"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="280661967"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:10:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="643185510"
Received: from hkanchar-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.36.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:10:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org
In-Reply-To: <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613102241.9236-1-Jason@zx2c4.com>
 <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
Date: Mon, 20 Jun 2022 19:10:30 +0300
Message-ID: <875ykvtix5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Re-add check for low
 voltage sku for max dp source rate
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

On Mon, 20 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> Hi Jani,
>
> Do you plan to merge this revert?

Yes, I've done that now, thanks for the bisection and the patch.

Ankit, Imre, we need to figure out what to do with [1] now.

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/5272



-- 
Jani Nikula, Intel Open Source Graphics Center
