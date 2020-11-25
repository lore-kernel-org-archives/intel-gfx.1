Return-Path: <SRS0=W/nN=E7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576E3C56202
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 10:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C120E206E0
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C120E206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F598982F;
	Wed, 25 Nov 2020 10:44:44 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7278982F
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 10:44:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23102587-1500050 for multiple; Wed, 25 Nov 2020 10:44:39 +0000
MIME-Version: 1.0
In-Reply-To: <20201125104011.606641-2-maarten.lankhorst@linux.intel.com>
References: <20201125104011.606641-1-maarten.lankhorst@linux.intel.com>
 <20201125104011.606641-2-maarten.lankhorst@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 25 Nov 2020 10:44:38 +0000
Message-ID: <160630107869.24141.3791784375033675124@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v5 01/63] drm/i915: Do not share hwsp across
 contexts any more, v6
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
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Maarten Lankhorst (2020-11-25 10:39:09)
> -               } while (!__igt_timeout(end_time, NULL));
> -               WRITE_ONCE(*(u32 *)tl->hwsp_seqno, 0xdeadbeef);
> +               } while (!__igt_timeout(end_time, NULL) &&
> +                        count < (PAGE_SIZE / TIMELINE_SEQNO_BYTES - 1) / 2);

Which part of this is NOT PAPERING OVER THE EXACT ISSUE I nacked this
patch over?

This series is still a joke. Go back to the design until you do not
break ABI.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
