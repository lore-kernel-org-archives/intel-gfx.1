Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413CFC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Dec 2021 17:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65510E1AE;
	Wed, 22 Dec 2021 17:20:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A7D10E1AE
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Dec 2021 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640193640; x=1671729640;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=5dL73oot1k/+QQ0q/bKmbJFyU8YokyOQ7yIYy2CvGYU=;
 b=X7MpvHmxboonizPv8g0VTr4N6r+JI9riqCGKVusXgCil9inAlyt7ebBZ
 0/s1wnnrTjndYfXLN+c9v8TzA8j/YmhlkNnsVr9npUYblKNsCEb4FlRdC
 ZB1UKUINjpxpEPN4gRet3mcpELdtnyIP96qFqIUVmYlFQDj6SMBNyNYd5
 Mdf3blKKRcGOClucmyz0JeS0O/Hu6nrzfZNuHJ5cWXviRpEy2nbdQZAiW
 nHZjILG/xcNsSNy3nJdOzWAXdIZrj9Do78E72ckqhcOe0OdaKfADQEa6v
 pIek+IHBrSyDaoNRlkiS/I7x+7+qp4ZK+e54s7N8Tz30dq6P6lu8xg7zB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304035907"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="304035907"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 09:05:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="468233654"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 09:05:43 -0800
Date: Wed, 22 Dec 2021 18:57:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ville Syrjala <ville.syrjala@linux.intel.com>
In-Reply-To: <20211222145350.24342-1-ville.syrjala@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2112221851510.1661468@eliteleevi.tm.intel.com>
References: <20211222145350.24342-1-ville.syrjala@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [Intel-gfx] [PATCH] ALSA: hda/hdmi: Disable silent stream on GLK
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
Cc: alsa-devel@alsa-project.org, Harsha Priya <harshapriya.n@intel.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Emmanuel Jillela <emmanuel.jillela@intel.com>, Takashi Iwai <tiwai@suse.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

On Wed, 22 Dec 2021, Ville Syrjala wrote:

> The silent stream stuff recurses back into i915 audio
> component .get_power() from the .pin_eld_notify() hook.
> On GLK this will deadlock as i915 may already be holding
> the relevant modeset locks during .pin_eld_notify() and
> the GLK audio vs. CDCLK workaround will try to grab the
> same locks from .get_power().
>
> Until someone comes up with a better fix just disable the
> silent stream support on GLK.

decoupling the call to get_power() is a non-trivial change
(especially as it's done from generic hda_codec.c code),
so I'd say let's go with this patch for GLK:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
