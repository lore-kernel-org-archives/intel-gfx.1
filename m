Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7812C43219
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9A16115C
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9A16115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6A66E43B;
	Tue, 14 Sep 2021 09:03:45 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8714E6E43B;
 Tue, 14 Sep 2021 09:03:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECC0F1FDD8;
 Tue, 14 Sep 2021 09:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631610222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve4sP6yJHxAL69h9Bdn3UH8pkWd4FZ+IdPOqhXFmJbY=;
 b=WSeLTVlyw4te/geWZhAPdf9of7DuXKdQo9vWnS6RGOPpa1P/2i27cezzyap0ifEwZt/7Ev
 6ikLRSb3mol1Jfr3D8cRXateWSWxYeX4iEFj/sIBecKWRM/p6WJ8aHaE5x56be+sc2xmcf
 2a3zdfwA8cr6gJJ93uNiKWSBINhcqsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631610222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve4sP6yJHxAL69h9Bdn3UH8pkWd4FZ+IdPOqhXFmJbY=;
 b=hnmLWSLB8KPA6QhtjGXHclQMdwFMUwfGXqgX3x1TFeCk6oE1p2f1gzzNIyVS5ed9IiFWGN
 JGv9QbJFxWgpqnBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73F0E13D3F;
 Tue, 14 Sep 2021 09:03:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MxqKGW5lQGEuNgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 14 Sep 2021 09:03:42 +0000
Message-ID: <efc1564c-d39c-c6d2-80de-5f79772732e4@suse.cz>
Date: Tue, 14 Sep 2021 11:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Imran Khan <imran.f.khan@oracle.com>, geert@linux-m68k.org,
 akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
References: <20210910141001.1622130-1-imran.f.khan@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20210910141001.1622130-1-imran.f.khan@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH 0/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
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

On 9/10/21 16:10, Imran Khan wrote:
> This change is in response to discussion at [1].
> The patch has been created on top of my earlier changes [2] and [3].
> If needed I can resend all of these patches together, though my
> earlier patches have been Acked.

I think you sent those at the beginning of merge window, so it would be best
to gather everything in a self-contained series now and resend. I suggested
another change for one of those anyway.

You can of course resend including the Acks you already got, as you did
already with "[PATCH v2 1/1] lib, stackdepot: Add helper to print stack
entries into buffer."

> [1] https://lore.kernel.org/lkml/e6f6fb85-1d83-425b-9e36-b5784cc9e69a@suse.cz/
> [2] https://lore.kernel.org/lkml/fe94ffd8-d235-87d8-9c3d-80f7f73e0c4e@suse.cz/
> [3] https://lore.kernel.org/lkml/85f4f073-0b5a-9052-0ba9-74d450608656@suse.cz/
> 
> Imran Khan (1):
>   lib, stackdepot: Add helper to print stack entries into buffer.
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
>  drivers/gpu/drm/drm_mm.c                |  5 +----
>  drivers/gpu/drm/i915/i915_vma.c         |  5 +----
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
>  include/linux/stackdepot.h              |  3 +++
>  lib/stackdepot.c                        | 23 +++++++++++++++++++++++
>  mm/page_owner.c                         |  5 +----
>  7 files changed, 35 insertions(+), 31 deletions(-)
> 

