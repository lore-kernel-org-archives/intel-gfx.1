Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD2C61DD3
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 20:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083B410E3C3;
	Tue,  1 Sep 2026 20:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="I40DR/9q";
	dkim-atps=neutral
X-Greylist: delayed 2703 seconds by postgrey-1.36 at gabe;
 Tue, 01 Sep 2026 20:41:59 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A081C10E3C3
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 20:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1788292614; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S9/mJ7KmVn977jPDDdzsFr5LRfpW/Y1dO3VMTG0mnXcY5yH09pbwGKXbKE/syfD4/JrlPXQdGFZsbVQE/aa6YnUEqF82QvmL7kNULOzyba++8n2n1G82hW1j9zRZ3VkaoKtXiJdSauMSe58vOGh92+Rsd5YQ/uUArod+OAMXyFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1788292614;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/qHEHJKZk4x+utXQVy6Oy+Uc44nyD4jHGrqzfQUFDl4=; 
 b=SrTQmYDG+WUZblInwkPO9rV3LJ7M6WDbL3+VozWxqEWldU9ugzgJgjm8SRIz1Yj8x581dpJOTLvxq9kujB0NtD0LAbZp1mR1sONxw4GsBTA+raj+N5DscyOCNJs1+jRvMfy4gDSf3WQZmE4s/nRe87YWOKTANQV/0Y8Wa3KNpDE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788292614; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=/qHEHJKZk4x+utXQVy6Oy+Uc44nyD4jHGrqzfQUFDl4=;
 b=I40DR/9q1pjeSuGReyLEANxWXGyDEOEBqHLpNqSJwSr922nDtsRHL9epBX6r7c+D
 JAD7QoZnlFIDcV+l2SqVmPvbcEyWe93v7PuZ1Di3zUNiP3QG8RpqCMxKQ2aSUQk6Aon
 bqOEzl78vS5K8+HXK6uHI5uqsCEBR4Ki4ukUdHdc=
Received: by mx.zohomail.com with SMTPS id 1788292612334323.7871735947235;
 Tue, 1 Sep 2026 12:56:52 -0700 (PDT)
Message-ID: <fc3f14c969e72d79ab59efd64e795b8dce3e4e61.camel@collabora.com>
Subject: XDC 2026: Full schedule now available
From: Mark Filion <mark.filion@collabora.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 01 Sep 2026 15:56:51 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Hello everyone,

Only a few weeks to go before XDC 2026 kicks off in Toronto, Canada!

The full schedule of talks is now available! Check out the schedule to
start planning which talks you don't want to miss.

https://xdc2026.x.org

The CfP has also reopened for Lightning Talks, Workshops, Meetings &
Hacking Sessions. Submissions are welcome, though acceptance is subject
to available time in the schedule.

https://indico.freedesktop.org/event/12/abstracts/

If you are planning to attend, please make sure to register.
Registration is free, and helps us plan for catering, evening events,
and nametags.

https://indico.freedesktop.org/event/12/registrations/

Best,

Mark
